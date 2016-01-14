describe User do

  describe '#authenticate' do
    it 'returns the user for a correct password' do
      create_user
      expect(User.authenticate('chris@chris.com', 'secret').email).to eq('chris@chris.com')
    end

    it 'returns nil with an incorrect password' do
      create_user
      expect(User.authenticate('chris@chris.com', 'wrong')).to eq(nil)

    end
  end

end
