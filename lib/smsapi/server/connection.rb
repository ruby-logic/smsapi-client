require 'net/http'

module Smsapi
  class Server
    class Connection
      def initialize(uri, port)
        @http = Net::HTTP.new(uri, port)
        @http.use_ssl = true
        @http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      end

      def post(path, params)
        @http.request post_request(path, params)
      end

      private

      def post_request(path, params)
        request = Net::HTTP::Post.new(path)
        request.set_form_data(params)
        request
      end
    end
  end
end
