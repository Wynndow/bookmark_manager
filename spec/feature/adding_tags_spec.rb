feature 'Adding tags to links' do

  scenario 'Adding a single tag to a link' do
    visit '/links/new'
    fill_in('title', with: 'Google')
    fill_in('url', with: 'www.google.com')
    fill_in('tag', with: 'search')
    click_button('Submit')
    expect(page).to have_content('search')
  end

end
