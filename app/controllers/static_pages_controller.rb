class StaticPagesController < ApplicationController
  def home
    
  end
  
  def index
    @microposts = Micropost.all
  end

  def logIn
  end
end
