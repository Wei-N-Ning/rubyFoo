#!/usr/bin/env ruby

# recall jq command line tool
# to retrieve the end value using a series of keys or nil
# if one of the key does not exist (or its value is nil)

require 'yaml'

def demo_dig(record, path)
  # symbolize keys
  # see: https://stackoverflow.com/questions/800122/best-way-to-convert-strings-to-symbols-in-hash
  # note that hash table keys are symbols not strings
  keys = path.split('/').map(&:to_sym)
  record.dig(*keys)
end

def demo_dig_yaml(yaml_filename, path)
  yml = YAML.load_file(yaml_filename)

  # yaml keys are strings
  yml.dig(*path.split('/'))
end

def main
  record = {
    'map': {
      'code': 'e1m1',
      'resources': {
        'geo': 'id3.pk3'
      }
    }
  }
  p demo_dig(record, 'map/code')
  p demo_dig(record, 'map/name')

  p demo_dig_yaml('./hash_yaml.yml', 'functions/get-index/handler')
end

main
