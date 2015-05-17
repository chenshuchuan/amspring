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

  def get_category(name)
     @category = Micropost.where('categ_name'=> name )
  end
end
