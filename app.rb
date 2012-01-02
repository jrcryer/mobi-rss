require 'httparty'
require 'cgi'
require './models/feed'

module MobiRSS

  class Application < Sinatra::Base

    helpers do
      include Rack::Utils
      alias_method :h, :escape_html
    end

    feeds = [
      'nettuts',
      'vectortuts',
      'mobiletuts',
      'aetuts',
      'phototuts',
      'cgtuts',
      'audiotuts',
      'webdesigntutsplus'
    ]

    before do
      expires 500, :public, :must_revalidate
    end

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

    get '/:feed/:guid' do
      
      unless feeds.include?(params[:feed])
        redirect to('/')
      else
        @title    = "#{params[:feed].capitalize} +"
        article   = Feed.article(params[:feed], CGI.unescape(params[:guid]))
        @article  = article['query']['results']['item']

        erb :article
      end 
    end

  end

end
