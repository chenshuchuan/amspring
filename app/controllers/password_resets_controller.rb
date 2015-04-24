class PasswordResetsController < ApplicationController
  layout "user"
  def new;end

  def create
    user = User.find_by_email(params[:email])
    if !user.nil?
      user.send_password_reset 
      redirect_to root_url, :notice => I18n.t("send_successfully")
    else
      flash[:error] = I18n.t("email_null")
      render :new
    end
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, :alert => I18n.t("send_expired")
    elsif @user.update_attributes(user_params)
      redirect_to root_url, :notice => I18n.t("login_again")
    else
      render :edit
    end
  end
  
  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end