class Like < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :post

  after_save :like_counter

  private

  def like_counter
    post.increment!(:linkesCounter)
  end
end
