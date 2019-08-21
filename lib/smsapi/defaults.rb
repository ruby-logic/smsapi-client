module Smsapi::Defaults
  def default_options
    {
      from: 'eco',
      test: '0',
      encoding: 'utf-8'
    }
  end
end
