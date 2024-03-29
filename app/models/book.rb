class Book < ApplicationRecord
   validates :title, presence: true
   validates :body, {presence: true, length: { in: 1..200 }}
   belongs_to :user
   has_many :book_comments, dependent: :destroy
   has_many :favorites, dependent: :destroy
   
   #タグ機能実装
   acts_as_taggable    


   def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
   end

end
