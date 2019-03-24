#!/usr/bin/env ruby

# source: udemy compr ruby prog s5l20
# class method vs. instance method
# class method can be called from class name
# doing so with instance method results in an error

class Task
  @@_options = ['static', 'dynamic']

  # class variable getter
  def self.options
    return @@_options
  end

  # class variable setter
  def self.set_options(new_options)
    @@_options = new_options
  end

  def compute
    ret = ''
    @@_options.each do |single| 
      ret += single.reverse
    end
    return ret
  end
end

def call_class_method
  p Task.options
  # p Task.compute  # error
  t1 = Task.new
  p t1.compute

  # modified class variable affects the class var getter and 
  # all the instances
  Task.set_options(['a', 'asd', 'c'])
  p Task.options
  p t1.compute
  t2 = Task.new
  p t2.compute
end

call_class_method
