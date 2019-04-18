#!/usr/bin/env ruby

# source:
# ruby way 3rd P/98

class SemanticVersion < String

  def initialize(str)
    raise <<~TEXT unless str =~ /^\d{1,4}(\.\d{1,4})*$/
      Malformed version string: #{str}
      A Version must be described as: x.y.z. 
      x, y, z are integer numbers between 0 and 9999
    TEXT
    super(str)
  end

  # to avoid infinite recursion 
  # because calling <=> inside the new <=> method implementation 
  # will recursively invoking the same method body 
  alias old_comparison <=>

  def <=>(other)
    this_arr = scan(/\d+/).map(&:to_i)
    other_arr = other.scan(/\d+/).map(&:to_i)
    nums = [this_arr.length, other_arr.length].max
    this_arr += [0] * (nums - this_arr.length)
    other_arr += [0] * (nums - other_arr.length)
    this_arr <=> other_arr
  end
end

def demo_semantic_version
  p [
    # lt
    SemanticVersion.new('3.1.0') <=> SemanticVersion.new('3.123.0'),
    # gt
    SemanticVersion.new('3.10.1') <=> SemanticVersion.new('1.0'),
    # eq
    SemanticVersion.new('0.5.0') <=> SemanticVersion.new('0.5'),
    SemanticVersion.new('5.0.0') <=> SemanticVersion.new('5'),
    # will raise an error 
    # SemanticVersion.new('abs0.4.0') <=> SemanticVersion.new('0.3.2'), 
    # SemanticVersion.new('3.9999999.0') <=> SemanticVersion.new('4.0')
  ]
end

demo_semantic_version

