module SMSApi
  class Server
    class Error < StandardError; end
    class ConnectionRefused < Error; end
    # etc.

    class << self
      def configure(username, password)
      end

      def configured?
        @username.present? and @password.present?
      end

      def verify_connection
        true
      end

      def send
        configure unless configured?
        {}
      end
    end
  end
end
