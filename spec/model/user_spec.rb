require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Tresor', photo: 'hhtps/manzi.com', bio: 'this is manzi user', postsCounter: 2) }
  before { subject.save }
  let(:user) { subject }
  it 'Name should not be empty' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'PostsCounter must be an integer greater than or equal to zero.' do
    expect(subject).to be_valid
  end
  it 'PostsCounter must be an integer greater than or equal to zero.' do
    subject.postsCounter = -1
    expect(subject).to_not be_valid
  end
end
