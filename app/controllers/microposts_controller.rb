class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]
  def new
    @micropost = Micropost.new
  end

  def index
    @microposts = Micropost.all
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
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
      params.require(:micropost).permit(:content)
    end
end