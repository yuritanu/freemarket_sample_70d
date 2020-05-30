class ProductsController < ApplicationController

  def index
  end
  
  def edit
  end

  def new
  end

  def show
  end

  # def buy
  #   @product = Product.find(params[:id])
  #   if @product.buyer.present?
  #     redirect_to confirmation_product_path(@product.id), alert: "売り切れです"
  #   else
  #     @product.with_lock do
  #       if current_user.credit.present?
  #         @credit = Credit.find_by(user_id: current_user.id)
  #         Payjp.api_key = 'sk_test_7ca83cd8b0bdf8e7771acc13'          
  #         Payjp::Charge.create(
  #           amount: @product.price,
  #           customer: @credit.customer_id,
  #           currency: 'jpy'
  #         )
  #         # binding.pry
  #         @product.update(buyer: current_user.id)
  #         redirect_to root_path
  #       else
  #         redirect_to credits_path, alert: "クレジット登録をお願いします"
  #       end
  #     end
  #   end
  # end

end
