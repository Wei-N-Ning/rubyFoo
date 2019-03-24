#!/usr/bin/env ruby

# source: udemy compr ruby prog s3l10
def interpolate_var 
  type_name = 'static'
  puts '#{type_name} interpolation'  # no interp (IDE warns)
  puts "#{type_name} interpolation"

  options = ['static', 'dynamic', 'runtime']
  puts "options are #{options}"
end

def _compute(lhs, rhs)
  return lhs * rhs
end

def interpolate_expr
  puts "compute: #{_compute(1, 30)}"
end

interpolate_var
interpolate_expr
