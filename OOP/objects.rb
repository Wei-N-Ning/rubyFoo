# Foo class
class Foo
  # Foo is a constant associated with a class
  # @@bar = 'cow' # class var
  # initialize is called when object is allocated
  def initialize(name: 'object')
    # name is an optional "keyword" argument
    @name = name # instance var
  end

  def prt(action:)
    # action is a compulsory "keyword" argument 
    print("#{@where} is a #{@name} #{action}")
  end

  attr_accessor :where
end

def demo_object
  foo = Foo.new(name: 'cow')
  foo.where = 'here'
  foo.prt(action: 'doing things')
end

demo_object
