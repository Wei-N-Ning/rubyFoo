#!/usr/bin/env ruby

class ApiConnector
  # no need to create java-like getter/setter methods
  attr_accessor :title, :desc, :url

  def compute
    # interface method, invoking the private implementation
    # which is overriden by subclass
    _compute
  end

  private 
    def _compute
      output = `ls -l /var/tmp`
      output.split("\n").length
    end
end

class AbiConnector < ApiConnector
  private
    def _compute
      # recall python's super()
      output = super
      output * 10
    end
end

def main
  api = ApiConnector.new
  p api.compute   # calling _compute() results in an error
  abi = AbiConnector.new
  p abi.compute
end

main()
