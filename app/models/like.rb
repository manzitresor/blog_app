class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :like_counter
  
  def like_counter
    post.increment!(:linkesCounter)
  end
end
