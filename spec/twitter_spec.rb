require_relative '../lib/twitter.rb'
require 'webmock/rspec'
require 'oauth'
require 'json'

describe Twitter do
  subject { Twitter.access_token }

  describe '.access_token' do
    let(:oauth_token) { ENV['ACCESS_TOKEN'] }
    let(:oauth_token_secret) { ENV['ACCESS_TOKEN_SECRET'] }

    it 'oauth_token' do
      expect(subject.token).to eq(oauth_token)
    end

    it 'oauth_token_secret' do
      expect(subject.secret).to eq(oauth_token_secret)
    end
  end

  describe '.trends' do
    subject { Twitter.trends }
    let(:name) { '#example' }
    let(:trends) do
      [{
        trends: [{
          name:  name,
          url:   "http://twitter.com/search?=%23#{name}",
          query: "%22#{name}%22"
        }]
      }]
    end
    before do
      stub_request(:get, 'https://api.twitter.com/1.1/trends/place.json?id=23424768')
        .to_return(body: JSON.generate(trends))
    end
    it 'Return the correct trend' do
      expect(subject).to eq([name])
    end
  end
  describe '.search' do
    subject { Twitter.search(hashtag) }
    let(:text) { 'example' }
    let(:statuses) do
      {
        statuses: [{
          created_at: 'Wed Aug 29 17:21:45 +0000 2018',
          id: '1034853625607200770',
          id_str: '1034853625607200770',
          text: text
        }]
      }
    end
    let(:hashtag) { 'example' }
    before do
      stub_request(
        :get,
        "https://api.twitter.com/1.1/search/tweets.json?q=%23#{hashtag}&count=10"
      ).to_return(body: JSON.generate(statuses))
    end
    it 'Return a correct array' do
      expect(subject).to eq([text])
    end
  end
end
