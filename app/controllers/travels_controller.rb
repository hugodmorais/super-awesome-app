class TravelsController < ApplicationController
  def index
  end

  def search
    countries = find_country(params[:country])
    unless countries.present?
      flash[:alert] = 'Country not found' if params[:country].present?
      return render action: :index
    end
    @country = countries.first
  end

  private

  def find_country(name)
    request = Api::Rapidapi::Api.new
    request.execute(name)
  end
end
