# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :login_required

  def new
    redirect_to root_path if current_user
  end

  def create
    user = User.find_by(email: session_params[:email])
    puts user.inspect
    if user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: 'ログインしました。'
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to root_path, notice: 'ログアウトしました。'
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
