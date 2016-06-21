require 'sinatra/base'
require 'sinatra/streaming'
require 'sinatra/reloader'
require 'sinatra/config_file'
require 'json'
require_relative 'lib/monitor'

# Main app that streams the system info
class App < Sinatra::Base
  register Sinatra::ConfigFile
  helpers Sinatra::Streaming

  configure :development do
    register Sinatra::Reloader
  end

  config_file 'config/app.yml'

  get '/' do
    status(404) && return if params[:token] != settings.token
    stream do |out|
      until out.closed?
        out.write Monitor.new.to_hash.to_json
        sleep 1
      end
      out.flush
    end
  end
end
