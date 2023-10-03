require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  subject do
    Post.new(author: user, title: 'Hello', text: 'This is my first post', comments_counter: 2, likes_counter: 1)
  end
  before { subject.save }
  it ' Title must not be blank.' do
    subject.title = nil
    expect(subject).to_not be_valid
  end
  it 'Title must not exceed 250 characters.' do
    subject.title = 'a' * 250
    expect(subject).to be_valid
  end
  it 'Comments Counter must be integer and greater than or equal to 0.' do
    subject.comments_counter = 'aa'
    expect(subject).to_not be_valid
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it 'Likes Counter must be integer and greater than or equal to 0.' do
    subject.comments_counter = 'aa'
    expect(subject).to_not be_valid
    subject.comments_counter = -1
    expect(subject).to_not be_valid
  end
  it '#posts_counter' do
    expect { subject.save }.to change { user.reload.post_counter }.by(1)
  end
  it 'should return last 5 recent comments ' do
    post = create(:post, author: user)

    create(:comment, :post, post:, user:, created_at: 1.day.ago)
    create(:comment, :post, post:, user:, created_at: 2.hours.ago)
    create(:comment, :post, post:, user:, created_at: 1.hour.ago)
    create(:comment, :post, post:, user:, created_at: 1.hour.ago)
    create(:comment, :post, post:, user:, created_at: 1.hour.ago)
    recent_comments = post.send(:recent_comments)

    expect(recent_comments.count).to eq(5)
  end
end
