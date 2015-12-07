module Smsapi
  class Credits

    attr_accessor :status, :error_code, :balance, :pro_sms_limit, :eco_sms_limit, :mms_limit, :vms_gsm_limit, :vms_stac_limit
    def initialize(server, options = {})
      @options = default_options.merge options
      @server = server
    end

    def check
      read_response @server.user(server_params).join(';')
      self
    end

    def sent?
      not self.status.nil?
    end

    def error?
      self.status == 'ERROR'
    end

    def success?
      self.status == 'Points'
    end

    def error_message
      Smsapi::ERROR_MESSAGES[error_code]
    end

    def read_response(response)
      response = response.split(':').map(&:strip)

      self.status = response[0]
      if status == 'ERROR'
        self.error_code = response[1]
      else
        data = response[1].split(';')
        self.balance        = data[0].to_f
        self.pro_sms_limit  = data[1].to_i
        self.eco_sms_limit  = data[2].to_i
        self.mms_limit      = data[3].to_i
        self.vms_gsm_limit  = data[4].to_i
        self.vms_stac_limit = data[5].to_i
      end
    end

    private

    def default_options
      {
        credits: 1,
        details: 1
      }
    end

    def server_params
      @options
    end
  end
end
