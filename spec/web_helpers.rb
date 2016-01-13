def submit_new_link(title: 'Google', url: 'www.google.co.uk', tag: 'search')
  visit '/links/new'
  fill_in('title', with: title)
  fill_in('url', with: url)
  fill_in('tag', with: tag)
  click_button('Submit')
end
