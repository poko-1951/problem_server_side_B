class PostsController < ApplicationController
  before_action :login_required, only: [:new, :create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to root_path, notice: "投稿しました"
    else
      redirect_to request.referer
    end
  end

  private

  def login_required
    redirect_to login_path unless current_user
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
