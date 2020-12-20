class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # @photos = @user.photos.paginate(page: params[:page])
  end

  def edit 
    @user = current_user 
  end 

  private

  # def user_params
    # NOTE: Using `strong_parameters` gem
    # params.require(:user).permit(:password, :password_confirmation)
  # end
end
