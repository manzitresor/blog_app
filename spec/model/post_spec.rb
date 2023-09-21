require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) { create(:user) }
  subject do
    Post.new(author: user, title: 'Hello', text: 'This is my first post', commentsCounter: 2, linkesCounter: 1)
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
    subject.commentsCounter = 'aa'
    expect(subject).to_not be_valid
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end
  it 'Likes Counter must be integer and greater than or equal to 0.' do
    subject.commentsCounter = 'aa'
    expect(subject).to_not be_valid
    subject.commentsCounter = -1
    expect(subject).to_not be_valid
  end
  it '#posts_counter' do
    expect { subject.save }.to change { user.reload.postsCounter }.by(1)
  end
end
