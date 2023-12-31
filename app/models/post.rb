class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true, length: { in: 1..250 }
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :posts_counter

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  private

  def posts_counter
    author.increment!(:post_counter)
  end
end
