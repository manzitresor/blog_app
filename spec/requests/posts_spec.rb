require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    before :each do
      get '/users/:user_id/posts'
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render index' do
      expect(response).to render_template(:index)
    end
    it 'should includes correct placeholder text' do
      expect(response.body).to include('User posts')
    end
  end
end
