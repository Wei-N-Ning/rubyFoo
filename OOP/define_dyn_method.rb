#!/usr/bin/env ruby

# db entity
class Author
  genres = %w[fiction coding history]

  # different to missing_method()
  # run at class loading time
  # missing_method: run at call time
  genres.each do |genre|
    define_method("#{genre}_details") do |_arg|
      "#{genre} details: #{_arg}"
    end
  end
end

def main
  author = Author.new
  p author.coding_details('doom')
  p author.respond_to?('fiction_details')
end

main
