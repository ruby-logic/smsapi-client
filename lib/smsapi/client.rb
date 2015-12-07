module Smsapi
  class Client
    def initialize(username, password)
      @server = Smsapi::Server.new(username, password)
    end

    def credits(options = {})
      Smsapi::Credits.new(@server, options).check
    end

    def send_single(to, message, options = {})
      Smsapi::SMS.new(to, message, @server, options).deliver
    end

    def schedule_single(to, message, date, options = {})
      Smsapi::SMS.new(to, message, @server, options).deliver_at(date)
    end

    def send_bulk(to, message, options = {})
      Smsapi::BulkSMS.new(to, message, @server, options).deliver
    end
  end
end
