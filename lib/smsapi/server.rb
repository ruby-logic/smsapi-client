module Smsapi
  class Server
    def initialize(token)
      @token = token
      @connection = setup_connection
    end

    def user(params = {})
      api_response = make_request(Smsapi::API[:user_path], params)
      api_response.split(';')
    end

    def sms(params = {})
      api_response = make_request(Smsapi::API[:sms_path], params)
      api_response.split(';')
    end

    private

    def setup_connection
      Smsapi::Server::Connection.new(
        Smsapi::API[:uri],
        Smsapi::API[:port],
        @token
      )
    end

    def make_request(path, params)
      @connection.post(path, params).body
    end
  end
end
