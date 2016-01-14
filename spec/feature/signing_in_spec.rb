feature 'Signing in' do

  context 'With correct password' do
    scenario 'A user can sign in and see a welcome message' do
      create_user
      sign_in
      expect(current_path).to eq('/links')
      expect(page).to have_content('Welcome, Wynndow')
    end
  end

  context 'With incorrect password' do

    scenario 'A user can not sign in and gets an error message' do
      create_user
      sign_in(password: 'wrong')
      expect(current_path).to eq('/session')
      expect(page).not_to have_content('Welcome, Wynndow')
      expect(page).to have_content('Incorrect username or password')
    end

  end


end
