class MailBoxsController < ApplicationController
  before_action :signed_in_user

  def index
    @outboxs = current_user.sent_messages
    @inboxs = current_user.received_messages
  end

  def show
    @message = current_user.messages.find(params[:id])
    @message.open
  end

  def destroy
    @message = current_user.messages.find(params[:id])
    if @message.destroy
      flash[:notice] = "All ok"
    else
      flash[:error] = "Fail"	
    end
    redirect_to mail_boxs_path
  end

  def create
    @to = User.find_by_email(params[:acts_as_messageable_message][:to])
    if !@to.nil?
      if !params[:acts_as_messageable_message][:body].blank? and !params[:acts_as_messageable_message][:topic].blank?
        current_user.send_message(@to, params[:acts_as_messageable_message][:topic], 
        	                           params[:acts_as_messageable_message][:body])
        flash[:success] = I18n.t("send_success")
      else
        flash[:error] = I18n.t("body_not_null")
      end
    else
      flash[:error] = I18n.t('email_null')
    end  
    redirect_to mail_boxs_path
  end

  def send_mail_box
  end
end
