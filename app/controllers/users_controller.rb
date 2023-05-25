class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :find_user, only: %i[show liked_photos]
  before_action :is_private!, only: :show

  def index
    @users = User.all
  end

  def show
    @own_posts = @user.posts
  end

  def edit
    @user = current_user
  end

  def liked_photos
    @liked_photos = @user.likes
  end

  private
  def find_user
    @user = User.find_by(user_name: params[:user_name])
  end

  def is_private!
    unless @user.present? && @user.private?
      redirect_to users_path
    end
  end
end
