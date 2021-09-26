class Api::Httparty::Httparty
  include HTTParty
  base_uri 'http://localhost:3000/api/v1/tasks'.freeze # base_uri example for tests
  URI = 'http://localhost:3000/api/v1/tasks'.freeze # base_uri example for tests
  attr_accessor :error_message, :params

  def get_json(url, params = {})
    begin
      response = self.class.get(url)
    rescue StandardError => e
      self.error_message = "Error API: #{e.message}"
      return false
    end
    # Guard clause
    respond_success(response)
    # JSON
    JSON.parse(response.body, symbolize_names: true)
  end

  def post(url, params = {})
    begin
      
      response = self.class.post(url, body: testing_params_for_task, timeout: 600)
    rescue StandardError => e
      self.error_message = "Error API: #{e.message}"
      return false
    end
    # Guard clause
    respond_success(response)
    # JSON
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def respond_success(response)
    return if response.success?

    message = response['error_message'] || response.message
    self.error_message = "Error API: #{message}"
  end

  # example params to post object
  def testing_params_for_task
    { 
      "task": {
        "title": 'Jason',
        "description": 'DescJSON'
      }
    }
  end
end
