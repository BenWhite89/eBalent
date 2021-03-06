class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

  def new
  	@user = User.new
  end

  def create
  	@user = User.create(params.require(:user).permit(:email, :password))
  	session[:user_id] = @user.id

  	redirect_to root_path
  end

  def index
  	current_user 
  end

  def update
  end
end
