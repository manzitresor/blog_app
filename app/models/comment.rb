class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :comment_counter

  def comment_counter
    post.increment!(:commentsCounter)
  end
end
