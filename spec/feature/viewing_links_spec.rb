feature 'Viewing links' do

  scenario 'Links are displayed' do
    link = Link.new(url: 'www.google.co.uk', title: 'Google')
    tag = Tag.new(tag: "")
    link.tags << tag
    link.save
    visit '/links'
    within 'ul#links' do
      expect(page).to have_content('Google')
    end
  end

end
