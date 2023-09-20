class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :posts_counter

  private

  def posts_counter
    author.increment!(:postsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
