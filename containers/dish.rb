#!/usr/bin/env ruby

# rubygems.org
require 'rubygems'

# gem install --user-install dish
# source: https://stackoverflow.com/questions/31596273/install-gem-in-local-folder
# When you use the --user-install option, RubyGems will install the 
# gems to a directory inside your home directory, something like 
# ~/.gem/ruby/1.9.1. The commands provided by the gems you installed
#  will end up in ~/.gem/ruby/1.9.1/bin. For the programs installed
# there to be available for you, you need to add ~/.gem/ruby/1.9.1/bin 
# to your PATH environment variable.
require 'dish'

def demo_dish
  mo = {
    project: "bfg", creature: "bfg01", puppets: ['bfg', 'acf']
  }
  motion = Dish(mo)
  p motion.project
  p motion.creature
  p motion.puppets
end

demo_dish()

