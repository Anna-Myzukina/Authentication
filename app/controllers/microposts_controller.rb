class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create]
  def new
    @micropost = Micropost.new
  end
  
  def create
    @micropost = current_user.microposts.build(micropost_params)
   
    if @micropost.save
      
      redirect_to root_path
    else
      render :new
    end
  end
  
  def index
    @micropost = Micropost.new
    @microposts = Micropost.all
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
      params.require(:micropost).permit(:title, :content)
    end
end