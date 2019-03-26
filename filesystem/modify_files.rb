#!/usr/bin/env ruby

# source: https://ruby-doc.org/core-2.2.0/File.html
# note ruby's ? jargon
def delete_file
  filename = '/var/tmp/acow'
  if File.exists?(filename)
    p "deleting #{filename}"
    File.delete(filename)
  end
end

def main
  delete_file
end

main
