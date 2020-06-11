class MypagesController < ApplicationController
  before_action :set_category

  def show
    user = User.find(params[:id])
  end

  def logout
  end

  def card
    @creditcard = Creditcard.find_by(user_id: current_user.id)
    if @creditcard.present?
      Payjp.api_key = Rails.application.credentials.test_secret_key
      customer = Payjp::Customer.retrieve(@creditcard.customer_id)
      @card = customer.cards.retrieve(@creditcard.card_id)
      @exp_month = @card.exp_month.to_s
      @exp_year = @card.exp_year.to_s.slice(2,3)
    end
  end

  private
  def set_category
    @parents = Category.where(ancestry: nil).order("id ASC")
  end
end
