#!/usr/bin/env ruby

# see:
# https://ruby-doc.org/stdlib-2.5.1/libdoc/matrix/rdoc/Matrix.html

require 'matrix'

def demo_matrix_creation
  m = Matrix[
    [1, 0, 0],
    [0, 1, 0],
    [0, 0, 1]
  ]
  puts m.row(0)
  puts m.[](0, 1)
end

def main
  demo_matrix_creation
end

main
