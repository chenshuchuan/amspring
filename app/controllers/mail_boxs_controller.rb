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
      flash[:notice] = I18n.t("delete")
    else
      flash[:error] = I18n.t("fail")
    end
    redirect_to mail_boxs_path
  end

  def send_email
    @user = User.find(params[:id])
    render 'new_email'
  end

  def create_email
    @user = User.find(params[:id])
    topic = params[:acts_as_messageable_message][:topic]
    body = params[:acts_as_messageable_message][:body]    
    send_box(@user,topic,body)
  end

  def create
    @to = User.find_by_email(params[:acts_as_messageable_message][:to])
    topic = params[:acts_as_messageable_message][:topic]
    body = params[:acts_as_messageable_message][:body]
    if !@to.nil?
      send_box(@to,topic,body)
    else
      flash[:error] = I18n.t('email_null')
    end  
    redirect_to mail_boxs_path
  end

  def send_box(user,topic,body)
    if !topic.blank? and !body.blank?
      current_user.send_message(user, topic, body)
      UserMailer.send_boxs(user, topic, body).deliver
      flash[:success] = I18n.t("send_success")
    else
      flash[:error] = I18n.t("body_not_null")
    end
  end

end
