require 'dotenv'
require 'json'
require 'oauth'

Dotenv.load('./.env')

module Twitter
  SITE = 'https://apps.twitter.com/app/'.freeze
  URL_TRENDS = 'https://api.twitter.com/1.1/trends/place.json?id=23424768'.freeze

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
      URL_TRENDS
    ).body
    trends = JSON.parse(response).first['trends']
    trends.map { |trend| trend['name'] }
  end

  def self.search(hashtag)
    response = access_token.request(
      :get,
      "https://api.twitter.com/1.1/search/tweets.json?q=%23#{hashtag}&count=10"
    ).body
    statuses = JSON.parse(response)['statuses']
    statuses.map { |s| s['text'] }
  end

  def self.user(user)
    response = access_token.request(
      :get,
      "https://api.twitter.com/1.1/users/show.json?screen_name=#{user}"
    ).body
    statuses = JSON.parse(response)['description']
  end
end
