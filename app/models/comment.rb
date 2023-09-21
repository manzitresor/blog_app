class Comment < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_save :comment_counter

  private

  def comment_counter
    post.increment!(:commentsCounter)
  end
end
