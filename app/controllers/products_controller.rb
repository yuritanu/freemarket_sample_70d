class ProductsController < ApplicationController
  before_action :set_product, except: [:index, :new, :create, :get_category_children, :get_category_grandchildren]

  def index
    @parents = Category.where(ancestry: nil).order("id ASC") 
  end

  def new
    @product = Product.new
    @product.images.new
    # @parents = Category.where(ancestry: nil).order("id ASC")
    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @category_parent_array = ["---"]
      #データベースから、親カテゴリーのみ抽出し、配列化
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @product.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def buy
    if @product.buyer.present?
      flash[:add_creditcard] = "申し訳ございません。先に他のお客様が購入されました。"      
      redirect_to product_path(@product.id)
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
          flash[:add_creditcard] = "クレジットカードの登録をお願いします。"
          redirect_to new_creditcard_path
        end
      end
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :explanation, :category_id, :brand, :product_status_id, :delivery_cost_id, :shipping_origin_id, :delivery_day_id, :price, images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  # 商品情報
  def set_product
    @product = Product.find(params[:id])
  end
end
