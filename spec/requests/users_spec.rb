require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before :each do
      get users_url
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render index' do
      expect(response).to render_template(:index)
    end
  end
  describe 'GET /show' do
    before :each do
      @user1 = User.create(
        name: 'Cosmas',
        photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
        bio: 'Web developer from Uganda',
        post_counter: 0
      )
      get user_path(@user1)
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render show' do
      expect(response).to render_template(:show)
    end
  end
end
