def submit_new_link(title: 'Google', url: 'www.google.co.uk', tag: 'search')
  visit '/links/new'
  fill_in('title', with: title)
  fill_in('url', with: url)
  fill_in('tag', with: tag)
  click_button('Submit')
end

def sign_up(username: 'Wynndow',
            email: 'chris@chris.com',
            password: 'secret',
            password_conf: 'secret')

  visit '/users/new'
  fill_in('username', with: username)
  fill_in('email', with: email)
  fill_in('password', with: password)
  fill_in('password_conf', with: password_conf)
  click_button('submit')
end

def sign_in(email: 'chris@chris.com', password: 'secret')
  visit('/session/new')
  fill_in('email', with: email)
  fill_in('password', with: password)
  click_button('Sign In')
end

def create_user
  User.create(username: 'Wynndow',
              email: 'chris@chris.com',
              password: 'secret',
              password_confirmation: 'secret')
end
