require 'httparty'

# client to talk to github api
class GithubApiDemo
  include HTTParty
  # where to find the api endpoint(s)
  # https://developer.github.com/v3/#root-endpoint
  base_uri 'https://api.github.com'

  def repositories
    # API doc
    # https://developer.github.com/v3/search/#constructing-a-search-query
    # curl https://api.github.com/search/repositories?q=tetris+language:assembly&sort=stars&order=desc
    self.class.get('/search/repositories?q=tetris')
  end
end

# how to construct query parameters (http get)
class GithubApiConnector
  include HTTParty
  base_uri 'https://api.github.com'

  def initialize(filter, page)
    # construct the parameters for http-get
    @options = { query: { q: filter } }
  end

  def repositories
    self.class.get('/search/repositories', @options)
  end

  def tags
    options = {

    }
    self.class.get('/repos/Wei-N-Ning/hourglass/tags', options)
  end
end

def api_demo
  cli = GithubApiDemo.new
  response = cli.repositories
  p response.code
  p response.message
  puts response.headers.inspect
  # p response.body
end

def connector_demo
  conn = GithubApiConnector.new('wallhack+language:assembly', 1)
  response = conn.repositories
  # p response.code
  # p response.message
  # puts response.headers.inspect
  # p response.body

  parse_response(response)

  response = conn.tags
  p response.code
  p response.body
end

def parse_response(resp)
  resp['items'].each do |entry|
    puts "#{entry['name']} #{entry['url']}"
  end
end

api_demo
connector_demo
