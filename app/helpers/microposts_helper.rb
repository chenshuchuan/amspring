module MicropostsHelper
  include StaticPagesHelper
  def wrap(content)
	sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
  end

  def comment_user(user_id)
    @user = User.find(user_id)
    @user.name

  end

  private

    def wrap_long_string(text, max_width = 30)
	  zero_width_space = "&#8203;"
	  regex = /.{1,#{max_width}}/
	  (text.length < max_width) ? text :
								  text.scan(regex).join(zero_width_space)
	end
end