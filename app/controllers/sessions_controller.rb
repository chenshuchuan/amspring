class SessionsController < ApplicationController
  def new; end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		sign_in user
  		flash[:success] = I18n.t(:weclome, :name => user.name )
  		redirect_back_or user
  	else
  		flash[:error] = I18n.t('errors_login') # Not quite right!
  		render 'new'
  	end	
  end

  def destroy
  	sign_out
	  redirect_to root_path
  end
end
