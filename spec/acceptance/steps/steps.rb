step 'there is a home page' do
  visit '/'
end

step 'there is a login page' do
  visit '/users/sign_in'
end

step 'I click login' do
  click_link('Login')
end

step 'login page should open' do
  expect(page).to have_current_path('/users/sign_in')
end

step 'I fill :email in email and :password in password' do |email, password|
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
end

step 'click enter' do
  find_field('user[password]').send_keys :enter
end

step 'login should be successful' do
  expect(page).to have_content 'Signed in successfully.'
end

step 'login should be failed' do
  expect(page).to have_content 'Invalid email or password.'
end
