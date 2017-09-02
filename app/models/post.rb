class Post < ApplicationRecord
  belongs_to :user

# 3/15 6
  acts_as_likeable
  #acts_as_likeable acts_as_liker

  # 14/03 7
 #  mount_uploader :avatar, AvatarUploader  and  changes as follows
  mount_uploader :post_image, PostImageUploader

  #14/03 4?
  validates :user_id, :description, presence: true

  # #14/03
  # def self.find_jamie_is_cool
  #   where(description: 'jamie is cool')
  # end

end
