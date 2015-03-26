class UsersController < ApplicationController
  before_action :signed_in_user, 
                only: [:index, :edit, :update, :destroy, :following, :followers, :messages]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.paginate(page: params[:page])
  end	

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = I18n.t(:congratulations, :name => @user.name )
      redirect_to @user
    else
      render 'new'
    end  	
  end	

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = I18n.t("update_success")
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = I18n.t("delete_user_success")
    redirect_to users_url
  end

  def following
    @title = I18n.t("following")
    @user = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = I18n.t("followers")
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  def send_email
    @user = User.find(params[:id])
    render 'new_email'
  end

  def create_email
    @user = User.find(params[:id])
    current_user.send_message(@user,params[:acts_as_messageable_message][:body])
    redirect_to users_url
  end

  def messages
    @messages = current_user.messages
  end

  def inbox
    @messages = current_user.received_messages
  end

  def outbox
    @messages = current_user.sent_messages
  end

  def show_messages
    @message = current_user.messages.find(params[:id])
  end

  def destroy_messages
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"
    end
  end

  private

    def user_params
  	  params.require(:user).permit({avatar:[]}, :name, :email, :password, :password_confirmation)
    end	

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
