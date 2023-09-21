class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  validates :title, presence: true
  validates :title, length: { maximum: 250}
  validates :commentsCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0}
  validates :linkesCounter, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  after_save :posts_counter

  private

  def posts_counter
    author.increment!(:postsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
