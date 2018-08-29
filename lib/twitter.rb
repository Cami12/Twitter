require 'dotenv'
require 'json'
require 'oauth'

module Twitter
  Dotenv.load('.env')
  SITE = 'https://apps.twitter.com/app/'.freeze

  def self.access_token
    consumer = OAuth::Consumer.new(
      ENV['CONSUMER_KEY'],
      ENV['CONSUMER_SECRET'],
      site: SITE
    )
  hash = {
    oauth_token:  ENV['ACCESS_TOKEN'],
    oauth_token_secret:  ENV['ACCESS_TOKEN_SECRET']
  }
  OAuth::AccessToken.from_hash(consumer, hash)
  end

  def self.trends
    response = access_token.request(
      :get,
      'https://api.twitter.com/1.1/trends/place.json?id=23424768'
    ).body
    trends = JSON.parse(response).first['trends']
    trends.map { |trend| trend['name'] }
  end
end
