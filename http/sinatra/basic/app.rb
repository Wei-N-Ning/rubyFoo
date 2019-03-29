require 'sinatra'

# demo
# - install dependencies on mac
#   gem install sinatra
# - execute
#   rackup
class Doomsday < Sinatra::Base
  get '/' do
    'IDDQD'
  end

  get '/dev/:arg' do
    "arg: #{params[:arg]}"
  end
end
