require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { create(:user) }
  let(:post) { create(:post, author: user) }
  subject { Comment.new(user: user, post: post) }

  it '#comment_counter' do
    expect { subject.save }.to change { post.reload.comments_counter }.by(1)
  end
end
