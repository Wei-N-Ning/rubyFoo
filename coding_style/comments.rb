#!/usr/bin/env ruby

# see:
# https://github.com/github/rubocop-github/blob/master/STYLEGUIDE.md
# http://tomdoc.org/

# block
# comments

=begin
also
block
comment (but discouraged by IDE)
=end

# a generator function
def generator
  x = 5 # inline comments
  puts '# not comment in quote'
  puts "interpolation: #{x}"
end

class Generator
  # class docstring...
end

generator
