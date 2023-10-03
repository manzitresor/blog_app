require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  before :each do
    @user_one = User.create(
      id: 1,
      name: 'Cosmas',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Web developer from Uganda',
      post_counter: 0
    )

    @posts = [
      @post1 = Post.create(
        author: @user_one,
        title: 'Blog1',
        text: 'This is my first post',
        comments_counter: 0,
        likes_counter: 0
      ),
      @post2 = Post.create(
        author: @user_one,
        title: 'Blog2',
        text: 'This is my second post',
        comments_counter: 0,
        likes_counter: 0
      )
    ]
  end

  describe 'GET /index' do
    before :each do
      get user_posts_url(user_id: @user_one.id)
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
      get user_post_path(@user_one, @post1)
    end
    it 'should returns http success' do
      expect(response).to have_http_status(:success)
    end
    it 'should render index' do
      expect(response).to render_template(:show)
    end
  end
end
