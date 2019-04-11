#!/usr/bin/env ruby

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




