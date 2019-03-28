#!/usr/bin/env ruby

# rubular.com
# ruby online regex tester

def match
  # str =~ /.../ returns the index of the first matched char
  # that's why if str =~ /.../ works 
  p 'there is a cow' =~ /cow/
  p 'there is a cow' =~ /aaaa/  # unmatched, return nil
end

# is there a list context?????
def capture_groups
  p 'iddqdidkfaidnoclip'.to_enum(:scan, /(id\w)/).map {Regexp.last_match}
end

match
capture_groups

