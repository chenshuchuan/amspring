class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :correct_user, only: :destroy

  def index
  end

  def show
  	@micropost = Micropost.find(params[:id])
  	@user = User.find(@micropost.user_id)
  end

  def new
  	@micropost = current_user.microposts.build
  end

  def create
  	@micropost = current_user.microposts.build(micropost_params)
  	if @micropost.save
  	  flash[:success] = "Micropost created!"
  	  redirect_to current_user
  	else
=begin
      @feed_items = []
  	  render 'static_pages/home'	
=end     
      render 'new'
    end
  end

  def destroy
    @micropost.destroy
    redirect_to current_user
  end

  private
    def micropost_params
      params.require(:micropost).permit(:content, :title)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end