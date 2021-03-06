class Comment < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

   validates :body, presence: true,
                    length: { minimum: 5 }
                    
  validates :user, presence: true
  
end
