CORRECT_EMAIL = 'lopandya96@gmail.com'
CORRECT_PASSWORD = 'lopandya96'
INCORRECT_EMAIL = 'FALSE@i.ua'
INCORRECT_PASSWORD = 'FALSE'

step 'I am on home page' do
  visit '/'
end

step 'I am on login page' do
  visit '/users/sign_in'
end

step 'I click login' do
  click_link('Login')
end

step 'I should see login page' do
  expect(page).to have_current_path('/users/sign_in')
end

step "I fill out :email email and :password password" do |email, password|
  email = case email
		  when 'correct'
			CORRECT_EMAIL
		  when 'incorrect'
			INCORRECT_EMAIL
		  else
			nil
	      end
		  
  password = case password
			 when 'correct'
			   CORRECT_PASSWORD
			 when 'incorrect'
			   INCORRECT_PASSWORD
			 else
			   nil
			 end
  fill_in('user[email]', :with => email)
  fill_in('user[password]', :with => password)
end

step 'I press enter key' do
  find_field('user[password]').send_keys :enter
end

step 'I should be logged in successfully' do
  expect(page).to have_content('Signed in successfully.')
end

step 'I should not be logged in' do
  expect(page).to have_content('Invalid email or password.')
end
