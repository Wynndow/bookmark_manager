feature 'Filtering tags' do

  scenario 'Links can be filtered by tag' do
    submit_new_link
    submit_new_link(title: 'Zombo', tag: 'bubbles', url:'www.zombo.com')
    expect(current_path).to eq('/links')
    visit('/tags/bubbles')
    within 'ul#links' do
      expect(page).to have_content('Zombo')
      expect(page).to_not have_content('Google')
    end
  end

end
