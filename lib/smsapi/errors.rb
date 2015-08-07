module SMSApi
  module Errors
    class Error < StandardError; end
    class GroupMissing < Error; end # 40
    class TemplateMissing < Error; end # 104
    # etc.
  end
end
