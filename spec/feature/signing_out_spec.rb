feature 'Signing out' do

  scenario 'A user can sign out and get a goodbye message' do
    sign_up
    click_button('Sign Out')
    expect(page).not_to have_content('Welcome, Wynndow')
    expect(page).to have_content('Goodbye')
  end


end
