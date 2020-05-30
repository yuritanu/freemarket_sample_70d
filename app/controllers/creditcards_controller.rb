class CreditcardsController < ApplicationController
  require "payjp"
  protect_from_forgery with: :null_session
  
  def index
    @creditcard = Creditcard.find_by(user_id: current_user.id)
    Payjp.api_key = 'test_secret_key'
    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    @card = customer.cards.retrieve(@creditcard.card_id)
    @exp_month = @card.exp_month.to_s
    @exp_year = @card.exp_year.to_s.slice(2,3)
  end

  def new
    @creditcard = Creditcard.new
  end

  def create
    if params['payjp-token'].blank?
      # paramsの中にjsで作った'payjpTokenが存在するか確かめる
        redirect_to action: "new"
    else
      Payjp.api_key = 'test_secret_key'
      customer = Payjp::Customer.create(
        card: params['payjp-token'], 
        email: current_user.email,
        metadata: {user_id: current_user.id}
     )
      @creditcard = Creditcard.new(customer_id: customer.id, card_id: customer.default_card, user_id: current_user.id)
      @creditcard.save
      redirect_to root_path
    end
  end


  def destroy
    credit = Credit.find_by(user_id: current_user.id)
    Payjp.api_key = 'sk_test_7ca83cd8b0bdf8e7771acc13'
    customer = Payjp::Customer.retrieve(credit.customer_id)
    card = customer.cards.retrieve(credit.card_id)
    card.delete
    customer.delete
    # credit = Credit.find(current_user.id)
    credit.destroy
    redirect_to root_path
  end

end
