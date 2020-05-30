class MypagesController < ApplicationController

  def index
  end

  def show
    user = User.find(params[:id])
  end

  def logout
  end

  def card
  end

  def newcard
  end

  # def show
    
  # end
  # マイページのルーティングは一旦indexにしています。ログイン機能実装後showに変更予定

end
