# require 'rails_helper'
require_relative './../../test/system/test_helper'

describe User, type: :model do
  context 'validate User TDD methods' do
    it 'get exactly 3 posts' do
      newuser = User.new
      result = newuser.recent_posts(1)
      expect(result).to eq(3)
    end
  end
end
