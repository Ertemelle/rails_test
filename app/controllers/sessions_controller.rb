class SessionsController < ApplicationController
  def new
  end

  def create
  	 @user = User.find_by(email: params[:session][:email])
  if User.all.include?(@user)
    else
      flash.now[:danger] = 'Invalid email'
      render 'new'
    end
    puts 'Jsuis al'
  end

  def destroy
  	log_out if logged_in?
  	redirect_to home_path
  end
end
