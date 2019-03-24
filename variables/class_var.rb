#!/usr/bin/env ruby

# source: udemy compr ruby prog s2l8
# class variable is shared by all the instances

class Task
  @@type_name = 'static'

  def get_type_name
    return @@type_name
  end
end

def demo_class_var
  t1 = Task.new
  t2 = Task.new

  p [t1.get_type_name, t2.get_type_name]
end

demo_class_var
