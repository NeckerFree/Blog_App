require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'Post validations' do
    subject { Post.create(author_id: 1, title: 'Hello', text: 'This is my first post') }

    before { subject.save }

    it 'title should not be blank' do
      subject.title = ''
      expect(subject).to_not be_valid
    end

    it 'title should not exceed 250 characters' do
      subject.title = 'x' * 251
      expect(subject).to_not be_valid
    end

    it 'comments counter should be an integer greater than or equal to zero' do
      subject.comments_counter = -10
      expect(subject).to_not be_valid
    end

    it 'likes counter should be an integer greater than or equal to zero' do
      subject.likes_counter = -10
      expect(subject).to_not be_valid
    end
  end
end
