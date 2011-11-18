require 'rubygems' if RUBY_VERSION < "1.9"
require 'sinatra/base'

class ServerRotate < Sinatra::Base
  get '/' do
    "No files detected"
    
  end
  
  get '/load' do
  end
end