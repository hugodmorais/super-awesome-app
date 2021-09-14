  class Api::Rapidapi::Api
    def initialize
      @host = Rails.application.credentials[Rails.env.to_sym][:rapidapi][:host]
      @key = Rails.application.credentials[Rails.env.to_sym][:rapidapi][:key]
    end

    def execute(name)
      get("name/#{name}")
    end

    private

    def get(name)
      response = Excon.get(
        @host + name,
        headers: {
          'X-RapidAPI-Host' => URI.parse(@host).host,
          'X-RapidAPI-Key' => @key
        }
      )

      return false if response.status != 200

      JSON.parse(response.body)
    end
  end
