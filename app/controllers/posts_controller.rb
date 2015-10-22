class PostsController < ApplicationController
  before_action :set_user

  def index
    @post = Post.all

  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end


  private

    def set_post
      @post = Post.find(params[:id])
    end
    #
    def set_user
      @user = User.find(params[:user_id])
    end

    def post_params
      params.require(:post).permit(:image, :caption)
    end

end
