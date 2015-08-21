require 'smsapi/client/version'
require 'smsapi/sms'
require 'smsapi/bulk_sms'

module SMSapi
  class Client
    class << self
      def send(args)
        # eg.
        # sms = SMS.new(defaults.merge(args))
        # sms.send
        # sms
      end

      def send_bulk(args)
        # eg.
        # bulk_sms = BulkSMS.new(defaults.merge(args))
        # bulk_sms.send
        # bulk_sms
      end

      def details
      end

      private

      def defaults
        {
          type: :eco
        }
      end
    end
  end
end
