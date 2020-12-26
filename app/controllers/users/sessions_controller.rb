# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  def new
    super
  end

  # POST /resource/sign_in
  # def create
  #    user = User.find_by(email: params[:session][:email].downcase)
  #   if user && user.authenticate(params[:session][:password])
  #     log_in user
  #     redirect_to user
  #   else
  #     flash.now[:danger] = 'Invalid email/password combination'
  #     render 'new'
  #   end
  # end
  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    photos_path(resource)
  end 
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path(resource)
  end 


  # DELETE /resource/sign_out
  def destroy
    super
  end

end
