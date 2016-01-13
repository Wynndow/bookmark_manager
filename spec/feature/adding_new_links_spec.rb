feature 'Adding new links' do

  scenario 'New links can be added' do
    visit '/links/new'
    fill_in('title', with: 'Reddit')
    fill_in('url', with: 'www.reddit.com')
    click_button('Submit')
    expect(current_path).to eq('/links')
    expect(page).to have_content('Reddit')
  end


end
