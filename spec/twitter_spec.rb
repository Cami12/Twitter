require_relative '../lib/twitter.rb'
require 'webmock/rspec'
require 'oauth'
require 'json'

  describe Authentication do
    subject { Authentication.access_token }
    describe '.access_token' do
      let(:oauth_token) ENV['ACCESS_TOKEN'],
      let(:oauth_token_secret) ENV['ACCESS_TOKEN_SECRET']
      it 'oauth_token' do
        expect(subject.token).to eq(oauth_token)
      end
      it 'oauth_token_secret' do
        expect(subject.secret).to eq(oauth_token_secret)
      end
    end
  end
  describe '.trends' do
    subject { Twitter.trends }
    let(:name) { '#example' }
    let(:trends) {
      [{ trends:
         [{name:  name,
           url:   "http://twitter.com/search?=%23#{name}",
           query: "%22#{name}%22" }] }]
    }
    before do
      stub_request(:get, 'https://api.twitter.com/1.1/trends/place.json?id=23424768')
        .to_return(body: JSON.generate(trends))
    end
    it 'Return the correct trend' do
      expect(subject).to eq([name])
    end
  end
end
