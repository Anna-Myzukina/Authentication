class PostsController < ApplicationController
  before_action :logged_in_user , only: [:new, :create]
  
      # before filter/action
    def logged_in_user
      unless signed_in?
        redirect_to signin_url
      end
    end
    
  def index
    @posts = Post.all
  end
  
  def new
      @post = Post.new
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
  def micropost_params 
    params.require(:micropost).permit(:content) 
  end 

end
