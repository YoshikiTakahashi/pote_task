class Users::SessionsController < Devise::SessionsController
  before_action :authenticate_user!
  def new
    super
  end
  #ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    photos_path(resource)
  end
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path(resource)
  end

  def destroy
    super
  end
end
