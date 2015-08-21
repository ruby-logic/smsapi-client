module SMSApi
  class BulkSMS
    def initialize(args)
      @sent = []
    end

    def send
      # eg.
      # read_response = server.send_bulk(server_params)
    end

    def delivered
      # eg.
      # @sent.select { |sms| sms.check_status }
    end

    def succeeded
      # @sent.select { |sms| sms.ok? }
    end

    def failed
      # @sent.select { |sms| sms.error? }
    end

    private

    def server_params
      {}
    end

    def server
      Server
    end

    def read_response(response)
      # eg.
      # response.each do |single_response|
      #   sms = SMS.new
      #   sms.read_response(single_response)
      #   @sent << sms
      # end
    end
  end
end
