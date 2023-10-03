require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  subject { Like.new(user:, post:) }
  before { subject.save }
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it '#like_counter' do
    expect { subject.save }.to change { post.reload.likes_counter }.by(1)
  end
end
