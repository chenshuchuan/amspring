module StaticPagesHelper
  def avatar(user_id)
	@user = User.find(user_id)
  end
end
