#!/usr/bin/env ruby

# continue from the example in use_github_api.rb
# write a tool to list all the release tags from a github
# repository

require 'httparty'

# uses caesar cipher to store the api token
TOKEN = "))('(TT*#%W($T$'W&*T%*V#VUTV%WVY+*$U&V$'".bytes.map{|c|c+13}.pack('c*')
# REPO = '/repos/Canva/infra-tools/tags'
REPO = '/repos/Wei-N-Ning/hourglass/tags'
GITHUB_API_ENDPOINT = 'https://api.github.com'

class GithubApiConnector
  include HTTParty
  base_uri GITHUB_API_ENDPOINT
  headers 'Authorization' => "token #{TOKEN}", 'User-Agent' => 'brew'

  def tags
    # Entry tag:

    # {"name"=>"v3.9.17", 
    # "zipball_url"=>"https://api.github.com/repos/Canva/infra-tools/zipball/v3.9.17", 
    # "tarball_url"=>"https://api.github.com/repos/Canva/infra-tools/tarball/v3.9.17", 
    # "commit"=>{
    #   "sha"=>"fd6fe7828624ea5a5420f8541278226d5b733588", 
    #   "url"=>"https://api.github.com/repos/Canva/infra-tools/commits/fd6fe7828624ea5a5420f8541278226d5b733588"
    #   }, 
    #   "node_id"=>"MDM6UmVmMTM3MDIwNTU5OnYzLjkuMTc="
    # }
    options = {}
    response = self.class.get(REPO, options)
    raise StandardError if response.code != 200
    versions = []
    version_by_commit = {}
    chosen_version = ''
    stable = ''
    stable_version = ''
    response.each do |entry|
      version_numbers = entry['name'].scan(/^v(\d+).(\d+)/)
      if version_numbers.empty?
        if entry['name'] == 'stable'
          stable = entry['commit']['sha']
        end
      else
        versions.push [version_numbers[0].map{|num|num.to_i}, entry['name']]
        version_by_commit[entry['commit']['sha']] = entry['name']
      end
    end
    raise StandardError if versions.empty?
    raise StandardError if stable == ''
    versions = versions.sort.map{|elem|elem[1]}
    stable_version = version_by_commit[stable]
    raise StandardError if stable_version == ''
    puts "stable: #{stable_version}"
    puts "latest: #{versions[-1]}"
  end

end

def main
  conn = GithubApiConnector.new
  conn.tags
end

main
