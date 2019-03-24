#!/usr/bin/env ruby

# source: udemy compr ruby prog s5l25
# *args and **kwargs

def compute(*values)
  if values.size == 0
    return ''
  end
  if values.size == 1
    return values[0].to_s
  end
  return [values[0], values[1..].join('')].join('.')
end

def stringify(**kwargs)
  pairs = []
  # note the hash table iteration syntax
  kwargs.each do |key, value|
    pairs.push("#{key}=#{value}")
  end
  return pairs.join(',')
end

def optional(options={})
  return [
    "cpu=#{options[:cpu]}", 
    "gpu=#{options[:gpu]}",
    "ram=#{options[:ram]}"
  ].join(',')
end

def main
  p compute()
  p compute(3)
  p compute(3, 1, 4, 1, 5, 9, 2, 6)

  p stringify()
  # p stringify(1, 2)  # error, unknown arguments
  p stringify(a:1, b:2)
  record = {
    'cpu': 'xeon', 'gpu': '2080ti', 'ram': '64g'
  }
  p stringify(record)

  p optional()
  p optional({cpu: 'i5'})
end

main
