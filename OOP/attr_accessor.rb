#!/usr/bin/env ruby

class ApiConnector
  # no need to create java-like getter/setter methods
  attr_accessor :title, :desc, :url

end

def main
  api = ApiConnector.new
  api.title = 'doom'  # invoking the setter method for :title
end

main()
