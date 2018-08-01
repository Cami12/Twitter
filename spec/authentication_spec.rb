require 'webmock/rspec'
require 'dotenv/load'
require_relative '../lib/authentication.rb'

describe Authentication do
  subject { Authentication.access_token }
  describe '.access_token' do
    let(:oauth_token) { 'iGHljzbzW2DRezQT9eCGNJND8' }
    let(:oauth_token_secret) { 'qcoe69tampK49QLR4xlb0YVg8QhdLjjAaRehviJMCwZRYIpZzv' }
    it 'oauth_token' do
      expect(subject.token).to eq(oauth_token)
    end
    it 'oauth_token_secret' do
      expect(subject.secret).to eq(oauth_token_secret)
    end
  end
end
