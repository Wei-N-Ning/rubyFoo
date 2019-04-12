#!/usr/bin/env ruby

# does heavy-lifting computation
class Solver
  def compute
    1
  end
end

# all app instances use one solver 
class App
  @@solver = Solver.new

  def result
    @@solver.compute
  end

  def solver
    @@solver
  end
end

# [#<App:0x00007ffe400e8738>, #<Solver:0x00007ffe400e87d8>]
# [#<App:0x00007ffe400e8530>, #<Solver:0x00007ffe400e87d8>]
def demo_class_attr
  a1 = App.new
  p [a1, a1.solver]
  a2 = App.new
  p [a2, a2.solver]
end

demo_class_attr
