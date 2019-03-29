#!/usr/bin/env ruby

require 'decisiontree'

# TODO: test with 1m training data records
class CustomerClassifier
  def initialize
    @attributes = %w[age edu income m]
    @training = [
      ['36-55', 'masters', 'high', 's', true],
      ['18-35', 'hsc', 'low', 's', false],
      ['36-55', 'masters', 'high', 's', true],
      ['18-35', 'phd', 'high', 'm', true],
      ['< 18', 'hsc', 'low', 's', true],
      ['55+', 'hsc', 'high', 'm', false],
      ['55+', 'hsc', 'high', 'm', true],
      ['55+', 'hsc', 'high', 'm', true],
      ['55+', 'hsc', 'high', 'm', true],
      ['< 18', 'masters', 'low', 's', false]
    ]
    @dec_tree = DecisionTree::ID3Tree.new(
      @attributes, @training, true, :discrete
    )
  end

  def do_training
    @dec_tree.train
  end

  def do_testing(testdata)
    decision = @dec_tree.predict(testdata)
    puts "Predicted (potential customer): #{decision}"
  end
end

def main
  cc = CustomerClassifier.new
  cc.do_training
  # has a matching training data record
  cc.do_testing(['< 18', 'hsc', 'low', 's'])

  # almost matching (3 out of 4)
  cc.do_testing(['< 18', 'hsc', 'high', 's'])

  # not matching
  cc.do_testing(['18-35', 'hsc', 'low', 'm'])

  # matching
  cc.do_testing(['18-35', 'phd', 'high', 'm'])
end

main
