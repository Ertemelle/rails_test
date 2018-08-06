class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(first_name: params[:user][:first_name], last_name: params[:user][:last_name], email: params[:user][:email])
  end

  def index
  end

  def show
  end

  def edit
  end

  def delete
  end
end
