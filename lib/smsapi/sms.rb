module SMSApi
  class SMS
    def initialize
    end

    def send
      # eg.
      # read_response server.send(server_params)
    end

    def remove
      # eg.
      # read_response server.remove(id)
    end

    def check_status
    end

    private

    def server
      Server
    end

    def server_params
      {}
    end

    def read_response(response)
    end
  end
end
