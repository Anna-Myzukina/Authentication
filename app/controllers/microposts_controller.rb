class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]
  def new
    @microposts = Micropost.new
  end
  
  def create
    @microposts = current_user.microposts.build(micropost_params)
    if @microposts.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  private

  # before filter/action
  def signed_in_user
    unless logged_in?
      redirect_to login_url
    end
  end

    def micropost_params
      params.require(:microposts).permit(:content)
    end
end