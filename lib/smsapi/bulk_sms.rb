module SMSApi
  class BulkSMS
    include SMSApi::Defaults

    attr_reader :sent, :to, :message
    def initialize(to, message, server, options = {})
      @options = default_options.merge options
      @to = to
      @message = message
      @server = server
      @sent = []
    end

    def deliver
      read_response @server.sms(server_params)
      self
    end

    private

    def server_params
      @options.merge(
        to: to.join(','),
        message: message
      )
    end

    def read_response(response)
      response.each do |single_response|
        sms = SMS.new(single_response.split(':').last, message, @server, @options)
        sms.read_response(single_response)
        @sent << sms
      end
    end
  end
end
