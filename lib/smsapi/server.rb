module SMSApi
  class Server
    def initialize(username, password)
      @username = username
      @password = password
      @connection = setup_connection
    end

    def sms(params = {})
      api_response = make_request(SMSApi::API[:sms_path], params)
      api_response.split(';')
    end

    private

    def setup_connection
      SMSApi::Server::Connection.new(
        SMSApi::API[:uri],
        SMSApi::API[:port]
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
