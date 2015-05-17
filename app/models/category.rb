class Category < ActiveRecord::Base
	validates :name, 
	          presence: true, 
	          uniqueness: { case_sensitive: false }, 
	          length: { maximum: 50 }
end
