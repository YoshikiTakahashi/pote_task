# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  
  def new
    super
  end

  # POST /resource/sign_in
  def create
     user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  # DELETE /resource/sign_out
  def destroy
    super
  end

end
