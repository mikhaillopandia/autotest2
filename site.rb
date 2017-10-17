require 'capybara/dsl'
include Capybara::DSL


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
  element :articles, :xpath, "//a[text()='Articles']"
  element :home, :xpath, "//a[text()='Home']"
  # for not logged in user
  element :login, :xpath, "//a[text()='Login']"
  element :sign_up, :xpath, "//a[text()='Sign up']"
  # for logged in user
  element :edit_account, :xpath, "//a[text()='Edit account']"
  element :logout, :xpath, "//a[text()='Logout']"
  element :users, :xpath, "//a[text()='Users']"
end
# Home page
class Home < SitePrism::Page
  set_url '/'
  set_url_matcher %r{demoapp.strongqa.com/?}

  element :login_success, :xpath, "//div[text()='Signed in successfully.']"
  section :menu, MenuSection, '#main_menu'
  include SiteActions
end
# Login page
class Login < SitePrism::Page
  set_url '/users/sign_in'
  set_url_matcher %r{demoapp.strongqa.com/users/sign_in}

  element :email, "input[name='user[email]']"
  element :password, "input[name='user[password]']"
  element :login_fail, :xpath, "//div[text()='Invalid email or password.']"
  section :menu, MenuSection, '#main_menu'
  include SiteActions

  def fill_form(credentials)
    self.email.set credentials[:email]
    self.password.set credentials[:password]
  end
end

def prerequisites
  Capybara.run_server = false
  Capybara.default_driver = :selenium
  Capybara.app_host = 'http://demoapp.strongqa.com'
  @login = Login.new
  @home = Home.new
end
prerequisites

def test_case(ref, name)
  puts "**#{ref} - #{name}"
  yield
rescue StandardError => e
  puts "[FAILED] #{e.message}"
ensure
  page.driver.quit
end

