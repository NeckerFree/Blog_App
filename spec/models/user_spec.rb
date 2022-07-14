describe User, type: :model do
  context 'validate User TDD methods' do
    it 'get exactly 3 posts' do
        newuser=User.new
      result = newuser.recent_posts(1)
      expect(result).to eq(3)
    end
  end
end
