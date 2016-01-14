feature 'Adding new users' do

  scenario 'A new user can sign up and see a welcome message' do
    expect{ sign_up }.to change{ User.count }.by(1)
    expect(current_path).to eq('/links')
    expect(page).to have_content('Welcome, Wynndow')
    expect(User.first.email).to eq('chris@chris.com')
  end

  scenario 'A user is not created if password conf doesn\'t match' do
    expect{ sign_up(password_conf: 'wrong') }.not_to change{ User.count }
    expect(page).to have_content('Password and confirmation do not match')
  end

  scenario 'A user can\'t sign up without entering an email address' do
    expect{ sign_up(email: '') }.not_to change{ User.count }
  end

end
