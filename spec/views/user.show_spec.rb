require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'show page' do
    before(:each) do
      @user =
        User.create(
          name: 'Tom',
          bio: 'Software Developer',
          photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
          postsCounter: 4
        )
      @post = Post.create(title: 'one post', text: 'first post', author_id: @user.id, commentsCounter: 0,
                          likesCounter: 0)
      @post_one = Post.create(title: 'two post', text: 'second post', author_id: @user.id, commentsCounter: 0,
                              likesCounter: 0)
      @post_two = Post.create(title: 'three post', text: 'third post', author_id: @user.id, commentsCounter: 0,
                              likesCounter: 0)
    end

    it "has users's profile picture." do
      visit user_path(@user.id)
      expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80']")
    end

    it "has users's username." do
      visit user_path(@user.id)
      expect(page).to have_content('Tom')
    end

    it "has users's bio." do
      visit user_path(@user.id)
      expect(page).to have_content('Software Developer')
    end

    it 'has users number of posts' do
      visit user_path(@user.id)
      expect(page).to have_content('Number of posts 3')
    end

    it 'has link to all posts' do
      visit user_path(@user.id)
      expect(page).to have_selector(:link_or_button, 'See all posts')
    end

    it 'has recent three posts' do
      visit user_path(@user.id)
      expect(page).to have_content('one post')
      expect(page).to have_content('second post')
      expect(page).to have_content('third post')
    end

    it 'redirects to user post show page' do
      visit user_posts_path(@user.id)
      expect(page).to have_current_path user_posts_path(@user.id)
    end

    it 'redirects to all user posts page' do
      visit user_path(@user.id)
      click_link 'See all posts'
      expect(page).to have_current_path user_posts_path(@user.id)
    end
  end
end
