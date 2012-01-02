class Feed
	include HTTParty
	base_uri 'query.yahooapis.com'

	def self.retrieve(feed)
		get( '/v1/public/yql', :query => {:q => "SELECT * FROM feed WHERE url='http://feeds.feedburner.com/#{feed}'", :format => 'json'})
	end

	def self.article(feed, guid)
		get( '/v1/public/yql', :query => {:q => "SELECT * FROM feed WHERE url='http://feeds.feedburner.com/#{feed}' AND guid = '#{guid}'", :format => 'json'})
	end
end