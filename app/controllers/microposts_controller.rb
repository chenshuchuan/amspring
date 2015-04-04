class MicropostsController < ApplicationController
  before_action :signed_in_user, only: [:new, :create, :destroy]
  before_action :correct_user, only: [:destroy, :edit, :update ]

  def index
    redirect_to root_url
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
  	  flash[:success] = I18n.t("micropost_created")
      @user = User.find(@micropost.user_id)
  	else
=begin
      @feed_items = []
  	  render 'static_pages/home'	
=end     
      render 'new'
    end
    render 'show'
  end

  def edit
    @micropost = Micropost.find(params[:id])
  end

  def update
    @user = User.find(@micropost.user_id)
    @micropost = Micropost.find(params[:id])
    if @micropost.update_attributes(micropost_params)
      flash[:success] = I18n.t("micropost_updated")
      render 'show'
    else
      redirect_to current_user
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