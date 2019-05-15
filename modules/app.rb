#!/usr/bin/env ruby

# source
# https://ruby-doc.com/docs/ProgrammingRuby/html/tut_modules.html

require_relative 'util'

def call_module_function
  Util.foo
end

p call_module_function
