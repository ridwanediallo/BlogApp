class Comment < ApplicationRecord
    belongs_to :user, class_name: "user", foreign_key: "user_id"
    has_many :posts, class_name: "post", foreign_key: "postId"
end
