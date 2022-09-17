class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  validates :title, presence: true, length: { maximum: 250}

  validates :commentsCounter, numericality: {only_integer: true, greater_than_or_equal_to: 0 }
  validates :likesCounter, numericality: {only_integer: true, greater_than_or_equal_to: 0 }

  def last_five_comments
    comments.last(5)
  end

  def update_posts_counter(counter)
    author.postsCounter = counter
    save
  end
end
