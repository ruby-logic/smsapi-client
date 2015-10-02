module Smsapi
  class Client
    def initialize(username, password)
      @server = Server.new(username, password)
    end

    def send_single(to, message, options = {})
      SMS.new(to, message, @server, options).deliver
    end

    def schedule_single(to, message, date, options = {})
      SMS.new(to, message, @server, options).deliver_at(date)
    end

    def send_bulk(to, message, options = {})
      BulkSMS.new(to, message, @server, options).deliver
    end

    def details
      # not implemented
    end
  end
end
