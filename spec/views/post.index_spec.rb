require 'rails_helper'

RSpec.describe 'Post', type: :system do
  describe 'index page' do
    before(:each) do
      @user =
        User.create(
          name: 'Tom',
          bio: 'Software Developer',
          photo:
            'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
          postsCounter: 4
        )
      @post =
        Post.create(
          title: 'one post',
          text: 'first post',
          author_id: @user.id,
          commentsCounter: 0,
          likesCounter: 0
        )
      @post_one =
        Post.create(
          title: 'two post',
          text: 'second post',
          author_id: @user.id,
          commentsCounter: 0,
          likesCounter: 0
        )
      @post_two =
        Post.create(
          title: 'three post',
          text: 'third post',
          author_id: @user.id,
          commentsCounter: 0,
          likesCounter: 0
        )
      Comment.create(
        text: 'welcome to the city',
        author_id: @user.id,
        post_id: @post_one.id
      )
      Comment.create(
        text: 'This movie is good',
        author_id: @user.id,
        post_id: @post_one.id
      )
      Comment.create(
        text: 'I love Africa',
        author_id: @user.id,
        post_id: @post_two.id
      )
      Like.create(post_id: @post.id, author_id: @user.id)
      Like.create(post_id: @post_one.id, author_id: @user.id)
      Like.create(post_id: @post_two.id, author_id: @user.id)
    end
    it "I can see the user's username." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Tom')
    end

    it "I can see the user's profile picture." do
      visit user_posts_path(@user.id)
      expect(page).to have_css(
        "img[src*='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80']"
      )
    end

    it 'I can see the number of posts each user has written.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content(3)
    end

    it "I can see the user's username." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('one post')
      expect(page).to have_content('two post')
      expect(page).to have_content('three post')
    end

    it "I can see some of the post's body." do
      visit user_posts_path(@user.id)
      expect(page).to have_content('first post')
      expect(page).to have_content('second post')
      expect(page).to have_content('third post')
    end

    it ' can see the first comments on a post.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('welcome to the city')
      expect(page).to have_content('This movie is good')
    end

    it 'I can see how many comments a post has.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Comments: 2')
      expect(page).to have_content('Comments: 1')
    end

    it 'I can see how many likes a post has.' do
      visit user_posts_path(@user.id)
      expect(page).to have_content('Likes: 1')
    end

    it 'redirects to all user posts page' do
      visit user_posts_path(@user.id)
      click_link 'one post'
      expect(page).to have_current_path user_post_path(@user.id, @post.id)
    end
  end
end
