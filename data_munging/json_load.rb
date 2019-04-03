#!/usr/bin/env ruby
# http://ruby-doc.org/stdlib-2.0.0/libdoc/json/rdoc/JSON.html
require 'json'

def deserialize_json
  JSON.load('[]')
end

p deserialize_json
