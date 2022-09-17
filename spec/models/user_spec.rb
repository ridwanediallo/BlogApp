require 'rails_helper'

RSpec.describe User, type: :model do
    subject { User.new(name: 'Ridwan', photo: 'ridwane.png', bio: 'A software developer', postsCounter: 50 ) }

    before { subject.save }

    it 'title should be present' do
        subject.name = nil
        expect(subject).to_not be_valid
    end

    it 'postsCounter should be an integer' do
        subject.postsCounter = 'hello'
        expect(subject).to_not be_valid
    end

    it 'postsCounter should be 50' do
        expect(subject.postsCounter).to be(50)
    end

end

