describe User do

  before do
    create_user
  end

  describe '#authenticate' do
    it 'returns the user for a correct password' do
      expect(User.authenticate('chris@chris.com', 'secret').email).to eq('chris@chris.com')
    end

    it 'returns nil with an incorrect password' do
      expect(User.authenticate('chris@chris.com', 'wrong')).to eq(nil)
    end
  end

  describe '#generate_token' do
    it 'changes the users password token' do
      expect{ User.first.generate_token }.to change{ User.first.password_token }
    end

    it 'creates a timestamp with the token' do
      Timecop.freeze do
        User.first.generate_token
        expect(User.first.password_token_time).to eq Time.now
      end
    end

  end

end
