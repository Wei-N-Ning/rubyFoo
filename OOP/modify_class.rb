class Car
end

# error: undefined method drive
# Car.new.drive

# to add the missing drive method
class Car
  def drive
    'zoom zoom'
  end
end

p Car.new.drive
