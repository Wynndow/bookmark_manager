feature 'Viewing links' do

  scenario 'Links are displayed' do
    Link.create(url: 'www.google.co.uk', title: 'Google')
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

end
