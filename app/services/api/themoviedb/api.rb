class Api::Themoviedb::Api
  BASE_URL = 'https://api.themoviedb.org/3/movie/'.freeze
  API_KEY = "api_key=#{Rails.application.credentials[Rails.env.to_sym][:themoviedb_api][:key]}".freeze

  def execute(number)
    response = Excon.get(BASE_URL + number.to_s + API_KEY).to_json
    JSON.parse(response)
  end

  private

end
