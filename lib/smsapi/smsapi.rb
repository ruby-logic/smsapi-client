require 'smsapi/server'
require 'smsapi/server/connection'
require 'smsapi/client'
require 'smsapi/defaults'
require 'smsapi/sms'
require 'smsapi/bulk_sms'
require 'smsapi/group_sms'

module SMSApi
  class Error < StandardError; end
  class ServerError < Error; end

  VERSION = "0.1.0"
  API = {
    uri: 'ssl.smsapi.pl',
    port: 443,
    sms_path: '/sms.do'
  }

  ERROR_MESSAGES = {
    '101' => 'Bad Credentials',
  }
end
