require 'spec_helper'

describe SMSApi::Server do
  before do
    @response = double(
      body: 'OK:12312:0.5'
    )
    @connection = double(
      post: @response
    )
    allow(SMSApi::Server::Connection).to receive(:new).and_return @connection
  end

  let(:username) { 'username' }
  let(:password) { 'password' }
  let(:server) { described_class.new(username, password) }

  it 'sets up a connection' do
    expect(SMSApi::Server::Connection).to receive(:new)
    server
  end

  describe '#sms' do
    it 'makes a post request to /sms.do and appends username and password' do
      expected = {
        username: username,
        password: password,
        to: '123',
        message: 'TEST MESSAGE'
      }
      expect(@connection).to receive(:post).with('/sms.do', expected)
      server.sms(to: '123', message: 'TEST MESSAGE')
    end

    it 'splits response into an array by semicolons' do
      allow(@connection).to receive(:post).and_return double(
        body: "OK:1412:0.5;ERROR:101;OK:21312:1.5"
      )
      expect(server.sms()).to eq(['OK:1412:0.5', 'ERROR:101', 'OK:21312:1.5'])
    end
  end
end
