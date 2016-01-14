feature 'Adding new users' do

  scenario 'A new user can sign up and see a welcome message' do
    visit '/users/new'
    fill_in('username', with: 'Wynndow')
    fill_in('email', with: "chris@chris.com")
    fill_in('password', with: 'secret')
    fill_in('password_conf', with: 'secret')
    expect{ click_button('submit') }.to change{ User.count }.by(1)
    expect(current_path).to eq('/links')
    expect(page).to have_content('Welcome, Wynndow')
    expect(User.first.email).to eq('chris@chris.com')
  end


end
