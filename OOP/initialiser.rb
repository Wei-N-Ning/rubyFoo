#!/usr/bin/env ruby

class ApiConnector
  # no need to create java-like getter/setter methods
  attr_accessor :title, :desc, :url

  def initialize(title, desc, url)
    # recall instance vars are shared by all methods
    @title = title
    @desc = desc
    @url = url
  end
end

def main
  api = ApiConnector.new('doom', '1993', 'dos')  # invoking initialize() 
  api.title = 'doom'  # invoking the setter method for :title
end

main()
