# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && authenticate(params[:session][:password])
      flash[:success] = 'Thank you signing in'
      sign_in user
      redirect_to root_path
    else
      flash.now[:error] = 'Email or password is invalid'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
