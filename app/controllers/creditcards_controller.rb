class CreditcardsController < ApplicationController
  require "payjp"
  protect_from_forgery with: :null_session
  
  def new
    @creditcard = Creditcard.new
  end

  def create
    # if文はparamsの中にjsで作った'payjpTokenが存在するか確かめています。
    if params['payjp-token'].blank?
        redirect_to action: "new"
        # payjp-tokenに問題がある場合はJSでalert「入力内容に誤りがあります。ご確認の上、再度入力願います。」が表示されます。
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
