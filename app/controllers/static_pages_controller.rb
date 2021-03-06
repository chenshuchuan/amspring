class StaticPagesController < ApplicationController
  def home
    sea  
    #@microposts = Micropost.paginate(:page => params[:page], :per_page => 10)
  	#if signed_in?
  	#  @micropost = current_user.microposts.build
  	#  @feed_items = current_user.feed.paginate(page: params[:page])
  	#end
    render :layout => "home"   
  end

  def search
    sea
    respond_to do |format|
      format.html {render 'home'}
      format.js 
    end 
  end

  def sea
    if params[:search].blank?
      @microposts = Micropost.paginate(:page => params[:page], :per_page => 10)
    else
      @search = Micropost.search do
        fulltext params[:search]
      end
      @microposts = @search.results
    end    
  end

  def help;end
  def about;end
  def contact;end
end
