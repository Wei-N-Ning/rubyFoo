#!/usr/bin/env ruby

# source: ruby way 3rd P130/1832

def demo_lookbehind
  # we couldn't just try to match a B and four chars because 
  # the B my have been the last char of the previous match
  gene = 'AABBABABBBAAAAABBBBABBAAABBABAAB'
  seqs = gene.scan(/(?<=B)(\w{4})/)
  p seqs
end

demo_lookbehind
