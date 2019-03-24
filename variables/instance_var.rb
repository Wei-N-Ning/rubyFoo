#!/usr/bin/env ruby

# scope to the instance; sharable among different methods
class Task
  def compute
    @queue = 2
  end

  def result
    p @queue
  end
end

def demo_instance_var
  t1= Task.new
  t1.compute()
  t1.result()  # 2

  t2 = Task.new
  t2.result()  # nil
end

demo_instance_var
