class PropertiesController < ApplicationController
  before_action :set_property

  def index
    respond_to do |format|
      format.html { render partial: 'properties/list', locals: { properties: @bank.properties, bank: @bank }}
    end
  end

  private

  def set_property
    @bank = Bank.find(params[:bank_id])
  end
end
