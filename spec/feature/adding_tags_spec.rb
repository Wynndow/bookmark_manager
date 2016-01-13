feature 'Adding tags to links' do

  scenario 'Adding a single tag to a link' do
    submit_new_link
    expect(page).to have_content('search')
  end

  scenario 'Adding multiple tags to a link' do
    submit_new_link(tag: 'search, find')
    expect(Link.first.tags.map(&:tag)).to include('search', 'find')
  end

end
