class ProductsController < ApplicationController

  def index
  end
  
  def edit
  end

  def new
  end

  def show
    @product = Product.find(params[:id])
  end

  def buy
    @product = Product.find(params[:id])
    if @product.buyer.present?
      redirect_to product_path(@product.id), alert: "売り切れです"
    else
      @product.with_lock do
        if current_user.creditcard.present?
          @creditcard = Creditcard.find_by(user_id: current_user.id)
          Payjp.api_key = Rails.application.credentials.test_secret_key
          Payjp::Charge.create(
            amount: @product.price,
            customer: @creditcard.customer_id,
            currency: 'jpy'
          )
          @product.update(buyer: current_user.id)
          redirect_to root_path
        else
          redirect_to new_creditcard_path, alert: "クレジットカードの登録をお願いします。"
        end
      end
    end
  end

end
