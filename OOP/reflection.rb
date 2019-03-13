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
    print 'FOOBAR'
  else
    print 'RABOOF'
  end
end

def demo
  foo = Foo.new
  foobar_defined(foo)
  bar = Bar.new
  foobar_defined(bar)
end

demo
