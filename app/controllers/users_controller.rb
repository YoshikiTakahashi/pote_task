class UsersController < ApplicationController
  # before_action :logged_in_user, only: [:show, :edit, :create, :destroy]
  def show
    @user = User.find(params[:id])
    @photos = @user.photos.paginate(page: params[:page])
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def edit 
    @user = current_user 
  end 

  private
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  # 正しいユーザーかどうかを確認
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  # 管理者かどうかを確認
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
