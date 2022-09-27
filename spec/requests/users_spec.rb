require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get users_path
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end

    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end
  describe 'GET /show' do
    before :each do
      get users_path
    end
    it 'is a success' do
      expect(response).to have_http_status(200)
    end
  end
end
