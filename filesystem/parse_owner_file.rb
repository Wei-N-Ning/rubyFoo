#!/usr/bin/env ruby

require 'find'

# iterate over and parse owner files
class Parser
  def to_list(filename:)
    File.open(filename, 'r') do |fp|
      text = fp.read
      return text.each_line.grep(%r{\S+})
    end
  end

  def parse_each(filename:)
    segment = filename.gsub(%r{#{@dir_path}\/}, '').gsub(%r{\/OWNERS}, '')
    @owners_by_service_name[segment] = {
      filename: filename,
      owners: to_list(filename: filename)
    }
  end

  def owner_file?(path)
    File.basename(path) =~ /^OWNERS$/
  end

  def parse(dir_path:)
    @dir_path = dir_path
    @owners_by_service_name = {}
    Find.find(dir_path) do |path|
      parse_each(filename: path) if owner_file?(path)
    end
  end

  def summary
    @owners_by_service_name
  end

  def find(pattern: nil)
    pattern = '.*' if pattern.nil?
    @owners_by_service_name.each_key do |service|
      if service =~ /#{pattern}/
        puts service
        puts @owners_by_service_name[service][:filename]
        puts @owners_by_service_name[service][:owners]
        puts ''
      end
    end
  end

  def show_usage_and_exit
    puts <<~TEXT
      parse_owner_file <dir_path>
    TEXT
    exit 0
  end
end

def main
  parser = Parser.new
  parser.show_usage_and_exit if ARGV.empty?

  parser.parse(dir_path: ARGV[0])
  parser.find(pattern: ARGV[1])
end

main
