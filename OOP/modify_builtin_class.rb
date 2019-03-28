#!/usr/bin/env ruby

# augment builtin string class
class String
  def censor(char)
    # ruby recognises gsub() as an instance method
    gsub!(/#{char}/, '*' * char.length)
  end
end

def main
  p 'there is a cow'.censor('i')
  p 'there is a fat cow'.censor('fat')
end

main
