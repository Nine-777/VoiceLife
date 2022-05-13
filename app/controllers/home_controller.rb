class HomeController < ApplicationController

  before_action :forbid_login_user, {only: [:top]}

  def top
  end

  def about
  end

  def index
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

end
