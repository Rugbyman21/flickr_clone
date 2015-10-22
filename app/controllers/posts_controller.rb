class PostsController < ApplicationController


  def index
    @post = Post.all
  end

  def show
  end

  def new
    @user = User.find(params[:user_id])
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = User.find(params[:user_id])
    @post.user = current_user
    if @post.save
      flash[:notice] = "Post created successfully"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "We are sorry to see you go."
    redirect_to user_path(@user)
  end

  def edit

    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    if @post.update(post_params)

      redirect_to user_path(@user.id)

    else
      render 'edit'
    end
  end




  private

    def post_params
      params.require(:post).permit(:image, :caption)
    end

end
