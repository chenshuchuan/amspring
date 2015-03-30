module MailBoxsHelper
 
 def get_box_user(user_id)
   @email = User.find(user_id).email
 end

 def status(value)
   flag = I18n.t('unread')
   if value == false
   	 flag
   else
     falg = I18n.t('read')
   end
 end

end
