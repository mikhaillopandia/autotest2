module SignInSteps
  step 'I should see login page' do
    expect(page).to have_current_path('/users/sign_in')
  end

  step "I fill out :type email" do |type|
    email = case type
  		    when 'correct'
		      'lopandya96@gmail.com'
		    else
			  'FALSE@i.ua'
		    end
    fill_in('user[email]', :with => email)
  end

  step "I fill out :type password" do |type|
    password = case type
			   when 'correct'
			     'lopandya96'
			   else
			     'FALSE'
			   end
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
end

RSpec.configure { |c| c.include SignInSteps, sign_in_steps: true }