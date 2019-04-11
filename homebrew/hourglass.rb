
class Hourglass < Formula

  class VersionUrlGetter
    def get_url
      require 'json'
      api_token = "?Ao=BCD@BrnCo@rEoDo?AECqo?r?o>F>@DDFA=>A".bytes.map{|c|c-0xD}.pack('c*')
      repository = 'Wei-N-Ning/hourglass'
      query_parameter = "/repos/#{repository}/tags"
      github_api_endpoint = 'https://api.github.com'

      cmdline = "curl "
      cmdline += "-H \"Authorization: token #{api_token}\" "
      cmdline += "-H \"User-Agent: brew\" "
      cmdline += "#{github_api_endpoint}#{query_parameter} "
      cmdline += "2>/dev/null"
      output = `#{cmdline}`
      raise StandardError if $?.exitstatus != 0
      response = JSON.load(output) 
      
      versions = []
      version_by_commit = {}
      stable_commit = ''
      stable_version = ''
      response.each do |entry|
        ver_str = entry['name']
        commit_hash = entry['commit']['sha']
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
      "https://github.com/#{repository}/archive/#{stable_version}.zip"
    end
  end

  desc 'hourglass micro service helper'
  homepage 'https://github.com/Wei-N-Ning/hourglass'
  url VersionUrlGetter.new.get_url()
  
  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    prefix.install Dir['src/*']
    (prefix/'VERSION').write(version)
    (bin/'hourglass').write <<~BASH
        #!/usr/bin/env bash
        if [[ "$1" == "--version" || "$1" == "-v" ]]; then
          echo '#{version}' && exit 0
        fi
        PYTHONPATH=#{prefix}:#{prefix}/vendor:#{prefix}/hourglass:${PYTHONPATH} python #{prefix}/hourglass "$@"
    BASH
  end
end
