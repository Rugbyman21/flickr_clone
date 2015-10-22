class UsersController < ApplicationController
  before_action :set_user, :set_post


  def index
    @users = User.all
  end

  def show
  end

  def update
    @user = current_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
