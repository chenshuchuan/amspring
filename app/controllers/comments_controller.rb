class CommentsController < ApplicationController
  before_action :signed_in_user
  
  def create
    @micropost = Micropost.find(params[:micropost_id])
    params[:comment][:user_id] = current_user.id
    @comment = @micropost.comments.create(comment_params)
    flash[:success] = I18n.t("comment_created")
    redirect_to micropost_path(@micropost)
  end
 
  def destroy
    @micropost = Micropost.find(params[:micropost_id])
    @comment = @micropost.comments.find(params[:id])
    @comment.destroy
    redirect_to micropost_path(@micropost)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:user_id, :body)
    end
end