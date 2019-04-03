# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://www.rubydoc.info/github/Homebrew/brew/master/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!

class Hourglass < Formula

  class Utils
    def get_url
      `echo https://github.com/Wei-N-Ning/hourglass/archive/v1.0.zip`.chomp
    end
  end

  desc 'hourglass micro service helper'
  homepage 'https://github.com/Wei-N-Ning/hourglass'
  url Utils.new.get_url()
  
  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    prefix.install Dir['src/*']
    (prefix/'VERSION').write(version)
    (bin/'hourglass').write <<~BASH
        #!/usr/bin/env bash
        echo '#{version}'
        PYTHONPATH=#{prefix}:#{prefix}/vendor:#{prefix}/hourglass:${PYTHONPATH} python #{prefix}/hourglass
    BASH
  end
end
