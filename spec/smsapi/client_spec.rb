require 'spec_helper'

describe SMSApi::Client do
  before do
    @server = double 'server'
    allow(SMSApi::Server).to receive_messages(
      new: @server
    )

    @sms = double 'sms',
      deliver: 'OK:123:0.5'
    allow(SMSApi::SMS).to receive_messages(
      new: @sms
    )
  end

  subject { described_class.new('username', 'password') }

  it 'builds a server connection' do
    username = 'test'
    password = '123123123'
    expect(SMSApi::Server).to receive(:new).with(username, password)

    described_class.new(username, password)
  end

  describe '#send_single' do
    let(:client) { described_class.new('username', 'password') }

    it 'creates a SMS' do
      expect(SMSApi::SMS).to receive(:new)
      client.send_single('500000000', 'message')
    end

    it 'delivers the created SMS' do
      expect(@sms).to receive(:deliver)
      client.send_single('500000000', 'message')
    end

    it 'includes server in the args' do
      expected = [
        '123456789',
        'Message',
        @server,
        {}
      ]
      given = [
        '123456789',
        'Message',
      ]

      expect(SMSApi::SMS).to receive(:new).with(*expected)
      client.send_single(*given)
    end
  end

  describe '#send_bulk' do
    pending 'Not implemented'
  end

  describe '#details' do
    pending 'Not implemented'
  end
end
