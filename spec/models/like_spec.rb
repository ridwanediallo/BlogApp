require 'rails_helper'

RSpec.describe Like, type: :model do
  before :each do
    @user_test = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                             bio: 'Teacher from Mexico.', postsCounter: 0)
    @user_test.save

    @post = Post.create(author: @user_test, title: 'Hello', text: 'This is my first post', commentsCounter: 0,
                        likesCounter: 0)
    @post.save

    @like = Like.create(post_id: @post.id, author_id: @user_test.id)
    @like.save
  end
  context 'Likes validations' do
    it 'validate update_likes_counter method' do
      @like.update_likes_counter = 3
      expect(@like.post.likesCounter).to be(3)
    end

    it 'Must belong to a user' do
      @like.author_id = nil
      expect(@like).to_not be_valid
    end

    it 'Must belong to a post' do
      @like.post_id = nil
      expect(@like).to_not be_valid
    end
  end
end
