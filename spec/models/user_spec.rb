require 'rails_helper'

RSpec.describe User, type: :model do
  context 'User validations' do
    subject { User.new(name: 'Elio', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Colombia.') }

    before { subject.save }

    it 'name should not be blank' do
      subject.name = ''
      expect(subject).to_not be_valid
    end

    it 'post counter should be an integer greater than or equal to zero' do
      subject.post_counter = -10
      expect(subject).to_not be_valid
    end
  end
end
