require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before :each do
      get '/users'
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
  describe "GET /show" do
    before :each do
      get '/users/:id'
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
  end
end
