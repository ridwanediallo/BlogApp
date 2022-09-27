require 'rails_helper'

RSpec.describe 'User', type: :system do
  describe 'index page' do
    before(:each) do
      @user =
        User.create(
          name: 'Tom',
          bio: 'Software Developer',
          photo: 'https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80',
          postsCounter: 4
        )
    end
    it 'I can see the username of all other users' do
      visit users_index_path
      expect(page).to have_content('Tom')
    end

    it 'I can see the profile picture for each user.' do
      visit users_index_path
      expect(page).to have_css("img[src*='https://images.unsplash.com/photo-1508921912186-1d1a45ebb3c1?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80']")
    end

    it 'I can see the number of posts each user has written.' do
      visit users_index_path
      expect(page).to have_content(0)
    end

    it "When I click on a user, I am redirected to that user's show page." do
      visit user_path(@user.id)
      expect(page).to have_content('Tom')
    end
  end
end
