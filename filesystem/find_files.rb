#!/usr/bin/env ruby

# UPDATE:
# see:
# Find.find()
# https://stackoverflow.com/questions/3498539/searching-a-folder-and-all-of-its-subfolders-for-files-of-a-certain-type

# use variable inside regex
# http://icfun.blogspot.com/2008/07/ruby-use-variable-inside-regex.html

# basename()
# https://apidock.com/ruby/File/basename/class

# motivation:
# I had strange issue pass the filenames returned from `find ...`
# to open() method
# the stackoverflow posts suggest using Dir.glob() instead of 
# `find ...` 
# read:
# https://stackoverflow.com/questions/6566884/rubys-file-open-gives-no-such-file-or-directory-text-txt-errnoenoent-er

# and here is how to implement abs_path() in ruby
# https://www.reddit.com/r/ruby/comments/3xt1uo/best_practice_relative_path_to_file_within/
# how to use __FILE__ builtin variable (recall Python)
# https://stackoverflow.com/questions/9416578/relative-path-to-your-project-directory

# see japFoo/reviewto.rb for live example

require 'find'

def find_files_recur(dir_path:, pattern:)
  collected = []
  return collected if dir_path.empty? || pattern.empty?

  Find.find(dir_path) do |path|
    collected.push(path) if File.basename(path) =~ /^#{pattern}$/
  end
  collected
end

p find_files_recur(dir_path: '', pattern: '\wWNERS')
p find_files_recur(
  dir_path: '/Users/weining/work/canva/infrastructure',
  pattern: 'OWNERS'
)
