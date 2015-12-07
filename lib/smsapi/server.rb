module Smsapi
  class Server
    def initialize(username, password)
      @username = username
      @password = password
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
        Smsapi::API[:port]
      )
    end

    def make_request(path, params)
      params = authorize_params(params)
      response = @connection.post(path, params)
      response.body
    end

    def authorize_params(params)
      params.merge(username: @username, password: @password)
    end
  end
end
