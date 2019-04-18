#!/usr/bin/env ruby

class Version
  def initialize(v)
    @v = v
  end
  
  def to_s
    @v.to_s
  end

  def to_str
    "Version(#{@v})"
  end
end

def demo_implicit_conv
  puts "release: #{Version.new(3.13)}"
end

def demo_explicit_conv
  puts "release: " + Version.new(3.13)
end

demo_implicit_conv
demo_explicit_conv

