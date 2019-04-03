#!/usr/bin/env ruby

# continue from the example in use_github_api.rb
# write a tool to list all the release tags from a github
# repository
# use httparty and curl in subprocess

require 'httparty'
require 'json'

# uses caesar cipher to store the api token
TOKEN = "))('(TT*#%W($T$'W&*T%*V#VUTV%WVY+*$U&V$'".bytes.map{|c|c+13}.pack('c*')
# REPO = '/repos/Canva/infra-tools/tags'
REPO = '/repos/Wei-N-Ning/hourglass/tags'
GITHUB_API_ENDPOINT = 'https://api.github.com'

class GithubApiConnector
  include HTTParty
  base_uri GITHUB_API_ENDPOINT
  headers 'Authorization' => "token #{TOKEN}", 'User-Agent' => 'brew'

  def response
    response = self.class.get(REPO, Hash::new)
    raise StandardError if response.code != 200
    response
  end
end

# curl -H "Authorization: token 66545aa702d51a14d37a27c0cbac2dcf871b3c14" https://api.github.com/repos/Canva/infra-tools/tags
class GithubApiCurler
  def response
    # how to set multiple header key-value
    # https://stackoverflow.com/questions/356705/how-to-send-a-header-using-a-http-request-through-a-curl-call
    cmdline = "curl "
    cmdline += "-H \"Authorization: token #{TOKEN}\" "
    cmdline += "-H \"USer-Agent: brew\" "
    cmdline += "#{GITHUB_API_ENDPOINT}#{REPO} "
    cmdline += "2>/dev/null"
    output = `#{cmdline}`
    # how to check command/process exit code
    # https://stackoverflow.com/questions/18728069/ruby-system-command-check-exit-code
    raise StandardError if $?.exitstatus != 0
    JSON.load(output)
  end
end

class GithubTagLister
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
    # response = GithubApiConnector.new.response
    response = GithubApiCurler.new.response
    versions = []
    version_by_commit = {}
    stable_commit = ''
    stable_version = ''
    # use Schwartzian Transform to sort the versions 
    response.each do |entry|
      ver_str = entry['name']
      commit_hash = entry['commit']['sha']
      # capture groups to array
      # https://stackoverflow.com/questions/4692437/regex-with-named-capture-groups-getting-all-matches-in-ruby/13817639
      ver_array = ver_str.scan(/^v(\d+).(\d+)/)
      if ver_array.empty?
        (stable_commit = commit_hash) if ver_str == 'stable'
      else
        versions.push [ver_array[0].map{|x|x.to_i}, ver_str]
        version_by_commit[commit_hash] = ver_str
      end
    end
    raise StandardError if versions.empty? || stable_commit == ''
    versions = versions.sort.map{|elem|elem[1]}
    stable_version = version_by_commit[stable_commit]
    raise StandardError if stable_version == ''
    [stable_version, versions[-1]]
  end
end

def main
  conn = GithubTagLister.new
  p conn.tags
end

main
