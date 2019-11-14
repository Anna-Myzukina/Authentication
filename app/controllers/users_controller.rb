class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        redirect_to new_user_path
      else
        render :new
      end
  end

  def update
  end

  def destroy
  end
end
