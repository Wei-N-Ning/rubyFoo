#!/usr/bin/env ruby

# the semantic is similar to that of JSON
require 'yaml'

def deserialize_yaml()
  YAML.load('[1, 2]')
end

p deserialize_yaml
