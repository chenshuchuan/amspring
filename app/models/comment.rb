class Comment < ActiveRecord::Base
  belongs_to :micropost

  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 10000 }
end
