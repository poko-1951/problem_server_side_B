class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
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

  def post_params
    params.require(:post).permit(:body)
  end
end
