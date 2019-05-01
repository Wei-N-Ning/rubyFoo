#!/usr/bin/env ruby

# source
# https://stackoverflow.com/questions/3498539/searching-a-folder-and-all-of-its-subfolders-for-files-of-a-certain-type

# if speed is a concern, prefer glob to Find.find

def do_glob(dir_path:, base_name:)
  # empty path can result in infinite recur loop
  if !dir_path.empty? && !base_name.empty?
    Dir.glob("#{dir_path}/**/#{base_name}")
  else
    []
  end
end

p do_glob(dir_path: '', base_name: 'a')
p do_glob(dir_path: '/Users/weining/work/canva/infrastructure', base_name: 'OWNERS')
