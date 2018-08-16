require 'json'
require 'oauth'

module Twitter
  def self.access_token
    consumer = OAuth::Consumer.new(
      'navHZwT1DyyYAYnekl4aHnmmA',
      'ArN46dgf7uqNn3DpK7znTeA9dMQJBzDACmg0MQTsklaf7DRNnQ',
      site: 'https://apps.twitter.com/app/'
    )
    hash = {
      oauth_token: '3380880963-CxLwiOUQ8W77HvVBfQP6WESJzBNKmCzJo8kConY',
      oauth_token_secret: 'VMEASXLc4YgeGjFheYDM4obHpqo0NQ72SB9uFIW7I0kAx'
    }
    OAuth::AccessToken.from_hash(consumer, hash)
  end

  def self.trends
    response = access_token.request(
      :get,
       'https://api.twitter.com/1.1/trends/place.json?id=23424768'
     ).body
    response = JSON.parse(response).first['trends']
    response.map { |trend| trend['name'] }
  end
end
