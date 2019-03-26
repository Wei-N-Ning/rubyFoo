#!/usr/bin/env ruby

# recall perl's map {}
def str_to_i
  ip = ['10', '1', '1', '123']
  p ip.map {|x| x.to_i}

  # short syntax
  p ip.map(&:to_i)
end

# recall perl and python's (k, v) pair based hash table creation 
def create_hash_table
  ip = ['10', '1', '0', '123']
  # note the (k, v) pair is defined as [k, v]
  ht = Hash[ip.map { |x| [x, x.to_i] }]
  p ht
end

# take a hash table and pack each k,v pair in the form of 
# k=v&k=v...
# p {a:1, b:2} won't work...
def urlify_changing
  {"JaneDoe" => 10, "JimDoe" => 6}.map{|k, v| "#{k}=#{v}"}.join('&')
end

str_to_i()
create_hash_table()
p urlify_changing()

