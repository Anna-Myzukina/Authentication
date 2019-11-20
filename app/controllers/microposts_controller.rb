class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :new]

  def create
    @micropost = Microposts.new(micropost_params)
    @micropost.user_id = current_user.id
    if @micropost.save
      flash[:success] = "Micropost created!"
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  def destroy
  end

  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
