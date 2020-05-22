class ProductsController < ApplicationController

  def index
    @parents = Category.where(ancestry: nil).order("id ASC").limit(3) 
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
