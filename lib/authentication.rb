require 'oauth'
require 'json'
module Authentication
  def self.access_token
    consumer = OAuth::Consumer.new(
      ' iGHljzbzW2DRezQT9eCGNJND8',
      'qcoe69tampK49QLR4xlb0YVg8QhdLjjAaRehviJMCwZRYIpZzv',
      site: 'https://apps.twitter.com/app/'
    )
    hash = {
      oauth_token: 'iGHljzbzW2DRezQT9eCGNJND8',
      oauth_token_secret: 'qcoe69tampK49QLR4xlb0YVg8QhdLjjAaRehviJMCwZRYIpZzv'
    }
    OAuth::AccessToken.from_hash(consumer, hash)
  end
end
