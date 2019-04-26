#!/usr/bin/env ruby

require 'active_support/time'

def demo_get_timezone
  p [Time.now, Time.now.zone]
end

# source:
# ruby way 3rd P220/1832
# see also:
# https://stackoverflow.com/questions/1386871/convert-time-from-one-time-zone-to-another-in-rails
def convert_timezone
  # require active_support/time module
  p [
    Time.now,
    Time.now.in_time_zone('Eastern Time (US & Canada)')
  ]
end

def main
  demo_get_timezone
  convert_timezone
end

main
