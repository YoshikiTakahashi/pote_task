class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show, :create, :destroy]
  before_action :correct_user, only: [:destroy]
  def index
    @photos = Photo.all.order(created_at: :desc)
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end

  def create
    @photo = current_user.photos.build(photo_params)
    if @photo.save
      flash[:success] = "Posted Photo!"
      redirect_to @photo
    else
      flash[:danger] = "Failed post Photo."
      @feed_items = []
      redirect_to root_path
    end
  end

  def destroy
    if @photo.destroy(photo_params)
      redirect_to root_path, notice: "投稿を削除しました"
    else 
      redirect_to root_path, alert: "投稿を削除できませんでした"
    end
  end
  
  private

  def photo_params
    params.require(:photo).permit(:picture, :title)
  end

  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
      redirect_to root_url if @photo.nil?
  end
end
