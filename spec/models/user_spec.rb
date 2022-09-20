require 'rails_helper'

RSpec.describe User, type: :model do
  subject { described_class.new(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  it 'Name attribute should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be an integer number' do
    subject.postsCounter = 'some random string'
    expect(subject).to_not be_valid
  end

  it 'Posts Counter attribute should be greater or equal to zero' do
    subject.postsCounter = -4
    expect(subject).to_not be_valid
  end
end
