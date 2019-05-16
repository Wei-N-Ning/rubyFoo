#!/usr/bin/env bash

ruby ./extconf.rb
make

irb <<"RUBY"
require_relative 'mytest.bundle'
include MyTest

puts test1
RUBY

