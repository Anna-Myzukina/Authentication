class MicropostsController < ApplicationController
  before_action :valid_user, only: [:create, :new]
  def new
    @micropost = Micropost.new
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

  def valid_user
    if !logged_in? 
      flash[:warning] = "You must be logged in to do that." 
      redirect_to root_url 
    end 
  end

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end