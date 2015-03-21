class SessionsController < ApplicationController
  def new; end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		flash[:success] = "#{user.name}，欢迎您再次登录博客!"
  		redirect_back_or user
  	else
  		flash[:error] = '密码或者邮箱错误！请从新输入！' # Not quite right!
  		render 'new'
  	end	
  end

  def destroy
  	sign_out
	  redirect_to root_path
  end
end
