module SiteActions
  def click_login
    self.menu.login.click
  end

  def click_enter
    self.password.send_keys :enter
  end
end

# General menu section for Login & Home pages
class MenuSection < SitePrism::Section
  # general elements
  element :articles, 'a', text: 'Articles'
  element :home, 'a', text: 'Home'
  # for not logged in user
  element :login, 'a', text: 'Login'
  element :sign_up, 'a', text: 'Sign up'
  # for logged in user
  element :edit_account, 'a', text: 'Edit account'
  element :logout, 'a', text: 'Logout'
  element :users, 'a', text: 'Users'
end
# Home page
class Home < SitePrism::Page
  set_url '/'
  set_url_matcher %r{demoapp.strongqa.com/?}

  element :login_success, 'div', text: 'Signed in successfully.'
  section :menu, MenuSection, '#main_menu'
  include SiteActions
end
# Login page
class Login < SitePrism::Page
  set_url '/users/sign_in'
  set_url_matcher %r{demoapp.strongqa.com/users/sign_in}

  element :email, "input[name='user[email]']"
  element :password, "input[name='user[password]']"
  element :login_fail, 'div', text: 'Invalid email or password.'
  section :menu, MenuSection, '#main_menu'
  include SiteActions

  def fill_form(credentials)
    self.email.set credentials[:email]
    self.password.set credentials[:password]
  end
end
