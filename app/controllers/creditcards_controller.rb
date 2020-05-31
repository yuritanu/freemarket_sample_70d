class CreditcardsController < ApplicationController
  require "payjp"
  protect_from_forgery with: :null_session
  
  

  def new
    @creditcard = Creditcard.new
  end

  def create
    if params['payjp-token'].blank?
      # paramsの中にjsで作った'payjpTokenが存在するか確かめる
        redirect_to action: "new" and return
    else
      Payjp.api_key = Rails.application.credentials.test_secret_key
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
    creditcard = Creditcard.find_by(user_id: current_user.id)
    Payjp.api_key = Rails.application.credentials.test_secret_key
    customer = Payjp::Customer.retrieve(creditcard.customer_id)
    card = customer.cards.retrieve(creditcard.card_id)
    card.delete
    customer.delete
    creditcard.destroy
    redirect_to root_path
  end

end
