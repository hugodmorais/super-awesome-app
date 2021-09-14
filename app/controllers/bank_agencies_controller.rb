class BankAgenciesController < ApplicationController
  before_action :set_bank

  def index
    respond_to do |format|
      format.html { render partial: 'bank_agencies/list', locals: { bank_agencies: @bank.bank_agencies, bank: @bank }}
    end
  end

  private

  def set_bank
    @bank = Bank.find(params[:bank_id])
  end
end
