class PhotosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :index, :show, :create, :destroy]
  before_action :correct_user, only: :destroy
  # before_action :logged_in_user, only: [:new, :index, :show, :create, :destroy]
  def new
    @photo = current_user.photos.build
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def index
    show_result = search_result ||= Photo.all
    @feed_items = show_result.paginate(page: params[:page])
  end

  def show
    @photo = Photo.find(params[:id])
    @user = User.find(@photo.user_id)
  end

  def create
    @photo = current_user.photos.build(photo_params)
    @photo.image.attach(params[:photo][:image])
    if @photo.save
      flash[:success] = "Posted Photo!"
      redirect_to @photo
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      flash[:danger] = "Failed post Photo."
      redirect_to @photo
    end
  end

  def destroy
    if @photo.destroy
      redirect_to photos_path, notice: "投稿を削除しました"
    else 
      redirect_to photos_path, alert: "投稿を削除できませんでした"
    end
  end
  
  private

  def photo_params
    params.require(:photo).permit(:image, :title)
  end

  def correct_user
    @photo = current_user.photos.find_by(id: params[:id])
      redirect_to root_url if @photo.nil?
  end
end
