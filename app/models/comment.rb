class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post

  validates :text, presence: true

  def update_comments_counter=(count)
    post.update_attribute 'commentsCounter', count
  end
end
