class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new

  end

  def create
  	@user = User.find_by_email(params[:email])

  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to root_url, notice: "Logged in!"
  	else
  		flash.now[:alert] = "Email or password is invalid"
  		render "new"
  	end
  end

  def welcome
    @talent_profiles = TalentProfile.order(rating: :desc).limit(3)
  end

  def page_requires_login
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_url, notice: "Logged out!"
  end
end
