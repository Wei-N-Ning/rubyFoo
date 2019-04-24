#!/usr/bin/env ruby

def demo_named_match
  text = 'there is a cow'
  re = /\s+(?<anyword>\w+)\s+\k<anyword>\s+/
  re.match(text)
end

demo_named_match






