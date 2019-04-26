#!/usr/bin/env ruby

def open_to_read
  # r+: reading and updating
  # oneliner syntax works also here
  File.open('/etc/ssh/ssh_config', 'r') do |fp|
    text = fp.read
    puts text.each_line.to_a.length
  end

  # streamlined read
  puts File.read('/etc/ssh/ssh_config').each_line.to_a.length
end

def open_to_write
  File.open('/var/tmp/sut/acow', 'w+') do |fp|
    fp.write(<<~"EOF")
      there is a 
      cow
      there is a cow
      EOF
    fp.puts(%w/there is a cow 113/)  # elements are written per line
    # just like the behavior of puts with stdout
  end
  puts `ls -larth /var/tmp/sut/acow`
end

def main
  open_to_read
  open_to_write
end

main
