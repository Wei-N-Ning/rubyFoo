#!/usr/bin/env ruby

# source
# http://www.rubyinside.com/how-to-create-a-ruby-extension-in-c-in-under-5-minutes-100.html

# STEP 1. create this file

# Loads mkmf which is used to make makefiles for Ruby extensions
require 'mkmf'

# Give it a name
extension_name = 'mytest'

# The destination
dir_config(extension_name)

# Do the work
create_makefile(extension_name)
