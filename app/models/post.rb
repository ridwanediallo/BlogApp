class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  has_many :likes
  has_many :comments

  def last_five_comments
    comments.last(5)
  end

  def update_posts_counter counter
    author.postsCounter = counter
    save
  end
end
