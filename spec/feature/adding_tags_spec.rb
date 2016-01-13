feature 'Adding tags to links' do

  scenario 'Adding a single tag to a link' do
    submit_new_link
    expect(page).to have_content('search')
  end

end
