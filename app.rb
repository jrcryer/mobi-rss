require 'httparty'
require './models/feed'

module MobiRSS

  class Application < Sinatra::Base

    feeds = [
      'nettuts',
      'psdtuts',
      'vectortuts',
      'mobiletuts',
      'aetuts',
      'phototuts',
      'cgtuts',
      'audiotuts',
      'webdesigntutsplus'
    ]

    get '/' do
      @feeds = feeds
      erb :index
    end

    get '/:feed' do
      
      unless feeds.include?(params[:feed])
        redirect to('/')
      else
        @title = "#{params[:feed].capitalize} +"
        @feed  = Feed.retrieve(params[:feed])
        erb :feed
      end 
    end

  end

end
