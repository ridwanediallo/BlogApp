class User < ApplicationRecord
    has_many :comments, class_name: "comment", foreign_key: "authorId"
    has_many :likes, class_name: "like", foreign_key: "authorId"
    has_many :posts, class_name: "post", foreign_key: "authorId"
end
