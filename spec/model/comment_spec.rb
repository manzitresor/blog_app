require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  subject { Comment.new(user:, post:) }
  before { subject.save }
  it '#comment_counter' do
    expect { subject.save }.to change { post.reload.commentsCounter }.by(1)
  end
end
