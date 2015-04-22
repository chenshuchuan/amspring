module StaticPagesHelper
  def avatar(user_id)
	  @user = User.find(user_id)
  end

  def usum
    @usum = User.all.count()
  end

  def msum
  	@msum = Micropost.all.count()
  end

  def csum
  	@csum = Comment.all.count()
  end

end
