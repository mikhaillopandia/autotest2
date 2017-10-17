Bundler.require(:default)
require 'spec_helper'

require 'capybara/rspec'
require_relative '../lib/site'

feature "the signin process" do
  given(:home) { Home.new }
  given(:login) { Login.new }

  context "when correct data" do
    given(:correct_credentials) { {email: 'lopandya96@gmail.com', password: 'lopandya96'} }

    scenario "User can open login page via menu" do
      home.load
      home.click_login
      expect(login).to be_displayed
    end

    scenario "User can login with correct credentials" do
      login.load
      login.fill_form(correct_credentials)
      login.click_enter
      home.wait_for_login_success
      expect(home).to have_login_success
    end
  end

  context "when incorrect login data" do

    context "when blank password" do
      given(:incorrect_credentials) { {email: 'lopandya96@gmail.com', password: ''} }
      scenario "User can not login with blank password" do
        login.load
        login.fill_form(incorrect_credentials)
        login.click_enter
        login.wait_for_login_fail
        expect(login).to have_login_fail
      end
    end

    context "when blank email" do
      given(:incorrect_credentials) { {email: '', password: 'lopandya96'} }
      scenario "User can not login with blank email" do
        login.load
        login.fill_form(incorrect_credentials)
        login.click_enter
        login.wait_for_login_fail
        expect(login).to have_login_fail
      end
    end

    context "when blank data" do
      given(:incorrect_credentials) { {email: '', password: ''} }
      scenario "User can not login with blank data" do
        login.load
        login.fill_form(incorrect_credentials)
        login.click_enter
        login.wait_for_login_fail
        expect(login).to have_login_fail
      end
    end

    context "when incorrect email" do
      given(:incorrect_credentials) { {email: 'FALSE@i.ua', password: 'lopandya96'} }
      scenario "User can not login with incorrect email" do
        login.load
        login.fill_form(incorrect_credentials)
        login.click_enter
        login.wait_for_login_fail
        expect(login).to have_login_fail
      end
    end

    context "when incorrect password" do
      given(:incorrect_credentials) { {email: 'lopandya96@i.ua', password: 'FALSE'} }
      scenario "User can not login with incorrect password" do
        login.load
        login.fill_form(incorrect_credentials)
        login.click_enter
        login.wait_for_login_fail
        expect(login).to have_login_fail
      end
    end

    context "when incorrect data" do
      given(:incorrect_credentials) { {email: 'FALSE@i.ua', password: 'FALSE'} }
      scenario "User can not login with incorrect password" do
        login.load
        login.fill_form(incorrect_credentials)
        login.click_enter
        login.wait_for_login_fail
        expect(login).to have_login_fail
      end
    end
  end
end
