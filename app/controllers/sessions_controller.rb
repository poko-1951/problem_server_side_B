class SessionsController < ApplicationController
  before_action :login_required, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to new_user_post_path(user), notice: "ログイン完了"
    else
      redirect_to request.referer, notice: "メールアドレスまたはパスワードが間違っています"
    end
  end

  def destroy
    reset_session
    redirect_to login_path, notice: "ログアウトしました"
  end

  private

  def login_required
    redirect_to root_path if current_user
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
