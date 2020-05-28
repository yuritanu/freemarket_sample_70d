require 'rails_helper'
RSpec.describe Users::RegistrationsController, type: :controller do
  describe 'GET #new' do
    it "レスポンスが成功" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      # ↑deviseを継承したcontrollerのテストの場合は、使用前にrequestする必要があるが、テストでは"route.rb"が使えないので明確に示す必要がある
      get :new
      expect(response).to be_successful
    end

    it "200ポンスを返すこと" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      post :new
      expect(response).to have_http_status "200"
    end
  end
  describe 'new_profileaddresses' do
    render_views
    context '有効なデータの場合' do
      before do
        @user = FactoryBot.attributes_for(:user_registration)
        @birthday= {"birthday(1i)"=>"2018", "birthday(2i)"=>"3", "birthday(3i)"=>"3"}
      end
      it "決まったviewを返す" do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        expect(post :new_profileaddresses, params: {birthday: @birthday,user: @user}).to render_template("users/registrations/new_profileaddresses")
      end
    end
    context '無効なデータの場合' do
      before do
        @user = FactoryBot.attributes_for(:user_registration,nickname:"")
        @birthday= {"birthday(1i)"=>"2018", "birthday(2i)"=>"3", "birthday(3i)"=>"3"}
      end
      it "決まったviewを返す" do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        expect(post :new_profileaddresses, params: {birthday: @birthday,user: @user}).to render_template("users/registrations/new")
      end
    end
  end
  describe 'new_deliveryaddresses' do
    render_views
    context '有効なデータの場合' do
      before do
        @data = User.new(FactoryBot.attributes_for(:user_registration_2))
        @profileaddress = FactoryBot.attributes_for(:profileaddress_registration)
      end
      it "決まったviewを返す" do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        session["devise.regist_data"] = {"user" => @data.attributes}
        session["devise.regist_data"]["user"]["password"] = @data["password"]
        @user = session["devise.regist_data"]
        expect(post :new_deliveryaddresses, params: {profileaddress: @profileaddress}).to render_template("users/registrations/new_deliveryaddresses")
      end
    end
    context '無効なデータの場合' do
      before do
        @data = User.new(FactoryBot.attributes_for(:user_registration_2))
        @profileaddress = FactoryBot.attributes_for(:profileaddress_registration,postal_code: "111-1111")
      end
      it "決まったviewを返す" do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        session["devise.regist_data"] = {"user" => @data.attributes}
        session["devise.regist_data"]["user"]["password"] = @data["password"]
        @user = session["devise.regist_data"]
        expect(post :new_deliveryaddresses, params: {profileaddress: @profileaddress}).to render_template("users/registrations/new_profileaddresses")
      end
    end
  end
  describe 'create' do
    render_views
    context 'バリデーション' do
      before do
        @request.host = "localhost：3000" 
        @password = FactoryBot.attributes_for(:user_registration_2)
        @data = User.new(FactoryBot.attributes_for(:user_registration_2))
        @profileaddress = Profileaddress.new(FactoryBot.attributes_for(:profileaddress_registration))
      end
      it "バリデーションを通す" do
        @deliveryaddress = FactoryBot.attributes_for(:deliveryaddress_registration)
        @request.env["devise.mapping"] = Devise.mappings[:user]
        session["devise.regist_data"] = {"user" => @data.attributes}
        session["devise.regist_data"]["user"]["password"]= @password[:password]
        
        session["profileaddress"] = @profileaddress.attributes

        expect(post :create, params: {deliveryaddress: @deliveryaddress}).to redirect_to("http://localhost：3000/")
      end
      it "バリデーションを通らない" do
        @deliveryaddress = FactoryBot.attributes_for(:deliveryaddress_registration,family_name:"")
        @request.env["devise.mapping"] = Devise.mappings[:user]
        session["devise.regist_data"] = {"user" => @data.attributes}
        session["devise.regist_data"]["user"]["password"]= @password[:password]
        
        session["profileaddress"] = @profileaddress.attributes

        expect(post :create, params: {deliveryaddress: @deliveryaddress}).to render_template("users/registrations/new_deliveryaddresses")
      end
    end
    context 'ユーザー登録' do
      before do
        @password = FactoryBot.attributes_for(:user_registration_2)
        @data = User.new(FactoryBot.attributes_for(:user_registration_2))
        @profileaddress = Profileaddress.new(FactoryBot.attributes_for(:profileaddress_registration))
      end
      it "登録できる" do
        @deliveryaddress = FactoryBot.attributes_for(:deliveryaddress_registration)
        @request.env["devise.mapping"] = Devise.mappings[:user]
        session["devise.regist_data"] = {"user" => @data.attributes}
        session["devise.regist_data"]["user"]["password"]= @password[:password]
        
        session["profileaddress"] = @profileaddress.attributes

        expect do
          post :create, params: {deliveryaddress: @deliveryaddress}
        end.to change{User.count}.by(1)
       
      end
    end
  end
end
