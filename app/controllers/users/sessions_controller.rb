# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    welcome_index_path
  end 
  #ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    root_path
  end 
end
