# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only: %i[index edit update destroy]
  def index
    @user = User.all
  end

  def show
    @microposts = Micropost.new
    @microposts = Micropost.all
    @user = User.find(params[:id])
    @micropost = current_user.microposts.build if logged_in?
  end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to @user
    else
      render 'new'
    end
  end

  def update; end

  def destroy; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def micropost_params
    params.require(:micropost).permit(:title, :content)
  end
end
