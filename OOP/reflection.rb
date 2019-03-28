#!/usr/bin/env ruby

# gem install --user-install ostruct
require 'ostruct'

# Foo class
class Foo
end

# Bar class
class Bar
  def initialize
    @foobar = 1
  end
end

def foobar_defined(object)
  if defined? object.foobar
    p 'FOOBAR'
  else
    p 'RABOOF'
  end
end

def demo
  foo = Foo.new
  foobar_defined(foo)
  bar = Bar.new
  foobar_defined(bar)
end

# recall python's __getattr__, __hasattr__ mechanism
class Author
  attr_accessor :first_name, :last_name, :genre

  def author
    OpenStruct.new(
      first_name: first_name,
      last_name: last_name,
      genre: genre
    )
  end

  def method_missing(method_name, *args, &block)
    if method_name.to_s =~ /^author_(.*)/
      author.send($1, *args, &block)
    else
      super
    end
  end

  def respond_to_missing?(method_name, include_private = false)
    !(method_name.to_s =~ /^author_/).nil? || super
  end
end

def call_missing_method
  author = Author.new
  author.first_name = 'doom'
  author.last_name = 'guy'
  author.genre = 'dos'

  p author.author_genre
end

def respond_to
  author = Author.new

  # test whether a method is defined (will the method go to
  # missing_method())
  p author.respond_to?('inspect')
  p author.respond_to?('iddqd')

  # without respond_to_missing?() this returns false
  p author.respond_to?('author_first_name')
end

def main
  demo
  call_missing_method
  respond_to
end

main
