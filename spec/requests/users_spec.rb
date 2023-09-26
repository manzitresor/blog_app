require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before :each do
      get '/users'
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render index' do
      expect(response).to render_template(:index)
    end
    it 'should includes correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
  describe "GET /show" do
    before :each do
      get '/users/:id'
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render show' do
      expect(response).to render_template(:show)
    end
    it 'should includes correct placeholder text' do
      expect(response.body).to include('Here is post for a given user id')
    end
  end
end
