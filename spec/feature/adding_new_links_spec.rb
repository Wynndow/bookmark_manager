feature 'Adding new links' do

  scenario 'New links can be added' do
    submit_new_link
    expect(current_path).to eq('/links')
    expect(page).to have_content('Google')
  end


end
