class ProductsController < ApplicationController

  MAX_DISPLAY_NEW_PRODUCTS = 3
  PER_DISPLAY_PRODUCTS = 3

  def index
    @new_products = Product.all.includes(:pictures).limit(MAX_DISPLAY_NEW_PRODUCTS).order('created_at DESC').where(buyer: nil)
    @products = Product.order("RAND()").all.includes(:pictures).where(buyer: nil).page(params[:page]).per(PER_DISPLAY_PRODUCTS)
  end
  
  def edit
  end

  def new
  end

  def show
  end

  # ↓5/16スプリントレビュー用
  def testshow
  end

  def testconfirm
  end
  # ↑5/16スプリントレビュー用


end
