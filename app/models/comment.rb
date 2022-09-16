class Comment < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "author_id"
  belongs_to :post

  def update_comments_counter(counter)
    post.commentsCounter = counter
    save
  end
end
