class PostsController < ApplicationController
  before_action :login_required, only: [:new, :create]
  before_action :ensure_correct_user, only: [:new]

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

  def ensure_correct_user
    @user = User.find(params[:user_id])
    if @user != current_user
      redirect_to root_path
    end
  end

  def post_params
    params.require(:post).permit(:body)
  end
end
