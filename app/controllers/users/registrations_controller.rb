# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  def create
    @user = User.new(birthday_save)
    @user.save
    redirect_to root_path
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private
    def birthday_save
      date = user_params
      year = date[:"birthday(1i)"]
      month = date[:"birthday(2i)"]
      day = date[:"birthday(3i)"]
      if year.empty? || month.empty? || day.empty?
        return
      end
        # 年月日別々できたものを結合して新しいDate型変数を作り,paramsに数字化したDataをくっつけました
        birthday = Date.new(year.to_i,month.to_i,day.to_i)
        params.require(:user).permit(:email,:password,:nickname,:family_name,:given_name,:family_name_kana,:given_name_kana).merge(birthday: birthday)
    end
    def user_params
      params.require(:user).permit(:email,:password,:nickname,:family_name,:given_name,:family_name_kana,:given_name_kana).merge("birthday(1i)": params[:birthday][:"birthday(1i)"]).merge("birthday(2i)": params[:birthday][:"birthday(2i)"]).merge("birthday(3i)": params[:birthday][:"birthday(3i)"])
      # paramsの中のカラム→:email,:password,:nickname,:family_name,:given_name,:family_name_kana,:given_name_kana,:birthday(1i),:birthday(2i),:birthday(3i)
    end
end
