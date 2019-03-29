#!/usr/bin/env ruby

require 'image_optimizer'

def main
  `cp ./image.png /var/tmp/image.png`
  imo = ImageOptimizer.new('/var/tmp/image.png', quality: 25)
  p imo.optimize
end

main
