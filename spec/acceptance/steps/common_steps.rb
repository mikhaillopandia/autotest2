module Turnip::Steps
  step 'I am on home page' do
    visit '/'
  end

  step 'I am on login page' do
    visit '/users/sign_in'
  end

  step 'I click login' do
    click_link('Login')
  end
end
