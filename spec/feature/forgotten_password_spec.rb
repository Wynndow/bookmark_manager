feature 'Forgotten Password' do

  before do
    sign_up
    Capybara.reset!
    allow(SendRecoverLink).to receive(:call)
  end

  scenario 'User can request a password reset' do
    visit '/session/new'
    click_link('Forgotten Password?')
    expect(current_path).to eq('/users/recover')
    expect(page).to have_content('Please enter your email address')
  end

  scenario 'User can submit email for recovery and get acknowledgement' do
    recover_password
    expect(page).to have_content('Thank you. Please check your emails.')
  end

  scenario 'user is assigned a reset token' do
    recover_password
    expect{ recover_password }.to change{ User.first.password_token }
  end

  scenario 'token expires after one hour' do
    recover_password
    Timecop.travel(60*60*60) do
      visit("/users/reset_password?token=#{User.first.password_token}")
      expect(page).to have_content('Sorry, your token has expired')
    end
  end

  scenario 'it asks for a new password if you supply a valid token' do
    recover_password
    visit("/users/reset_password?token=#{User.first.password_token}")
    expect(page).to have_content('Please enter a new password')
  end

  scenario 'it lets you enter a new password if you have a valid token' do
    recover_password
    visit("/users/reset_password?token=#{User.first.password_token}")
    fill_in('password', with: 'newpassword')
    fill_in('password_conf', with: 'newpassword')
    click_button('Submit')
    expect(page).to have_content("Sign In")
  end

  scenario 'it lets you sign in after a password reset' do
    recover_password
    visit("/users/reset_password?token=#{User.first.password_token}")
    fill_in('password', with: 'newpassword')
    fill_in('password_conf', with: 'newpassword')
    click_button('Submit')
    sign_in(password: 'newpassword')
    expect(page).to have_content('Welcome, Wynndow')
  end

  scenario 'it lets you know if your new passwords do not match' do
    recover_password
    visit("/users/reset_password?token=#{User.first.password_token}")
    fill_in('password', with: 'newpassword')
    fill_in('password_conf', with: 'different')
    click_button('Submit')
    expect(page).to have_content('Password and confirmation do not match')
  end

  scenario 'it calls the SendRecoverLink service to send the link' do
    expect(SendRecoverLink).to receive(:call).with(User.first)
    recover_password
  end

end
