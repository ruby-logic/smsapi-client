require 'smsapi/server'
require 'smsapi/server/connection'
require 'smsapi/client'
require 'smsapi/defaults'
require 'smsapi/credits'
require 'smsapi/sms'
require 'smsapi/bulk_sms'
require 'smsapi/group_sms'

module Smsapi
  class Error < StandardError; end
  class ServerError < Error; end

  VERSION = '0.3.1'
  API = {
    uri: 'ssl.smsapi.pl',
    port: 443,
    user_path: '/user.do',
    sms_path: '/sms.do'
  }

  ERROR_MESSAGES = {
    '101' => 'Bad Credentials',
    '1001' => 'Bad Request Format'
  }
end
