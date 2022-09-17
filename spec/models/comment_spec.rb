require 'rails_helper'

RSpec.describe Comment, type: :model do
  before :each do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                        bio: 'Teacher from Mexico.', postsCounter: 0)
    @user.save
    @post = Post.create(author: @user, title: 'Hello', text: 'This is my first post', commentsCounter: 0,
                        likesCounter: 0)
    @post.save
    @comment = Comment.create(text: 'This is my first comment', post: @post, author: @user)
    @comment.save
  end

  it 'Must belong to a user' do
    @comment.author_id = nil
    expect(@comment).to_not be_valid
  end

  it 'Must belong to a post' do
    @comment.post_id = nil
    expect(@comment).to_not be_valid
  end

  it 'Will update the post comments_counter' do
    @comment.update_comments_counter = 3
    expect(@comment.post.commentsCounter).to eq 3
  end
end
