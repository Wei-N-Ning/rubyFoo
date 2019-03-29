#!/usr/bin/env ruby

require 'decisiontree'

# gem install decisiontree
class DecisionTreeDemo
  def initialize
    @attributes = ['Temp']
    @training = [
      [98.7, 'healthy'],
      [99.1, 'healthy'],
      [99.5, 'sick'],
      [100.5, 'sick'],
      [102.5, 'crazy sick'],
      [107.5, 'dead']
    ]
    @dec_tree = DecisionTree::ID3Tree.new(
      @attributes, @training, 'sick', :continuous
    )
  end

  def do_training
    @dec_tree.train
  end

  def do_testing(testdata)
    decision = @dec_tree.predict(testdata)
    puts "Predication: #{decision}"
    puts "Reality: #{testdata.last}"
  end
end

def main
  dec = DecisionTreeDemo.new
  dec.do_training

  dec.do_testing([98.7, 'healthy'])
  dec.do_testing([107.5, 'healthy'])
end

main
