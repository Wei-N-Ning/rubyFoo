#!/usr/bin/env ruby

class ApiConnector
  # no need to create java-like getter/setter methods
  attr_accessor :title, :desc, :url

  def compute
    _compute
  end

  private 
    def _compute
      output = `ls -l /var/tmp`
      p output.split("\n")
    end
end

def main
  api = ApiConnector.new
  api.compute   # calling _compute() results in an error
end

main()
