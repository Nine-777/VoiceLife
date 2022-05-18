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
    redirect_to posts_path, notice: "#{ current_user.name }でログインしました"
  end

end
