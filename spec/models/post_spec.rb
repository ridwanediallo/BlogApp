require 'rails_helper'

RSpec.describe Post, type: :model do
    subject { Post.new(title: 'Hello poeple', text: 'Everybody come on he is waking up.', commentsCounter: 5,  likesCounter: 10) }

    before { subject.save }

    it 'title should be present' do
        subject.title = nil
        expect(subject).to_not be_valid
    end

    it 'title should be present' do
        subject.text = 'text' * 250
        expect(subject).to_not be_valid
    end

    it 'commentsCounter should be an integer' do
        subject.commentsCounter = '20'
        expect(subject).to_not be_valid
    end

    it 'likesCounter should be an integer' do
        subject.likesCounter = '100'
        expect(subject).to_not be_valid
    end

    it 'commentsCounter should be 5' do
        expect(subject.commentsCounter).to be(5)
    end

    it 'likesCounter should be 10' do
        expect(subject.likesCounter).to be(10)
    end

end

