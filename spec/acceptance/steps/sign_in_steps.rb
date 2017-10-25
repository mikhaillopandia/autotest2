module SignInSteps
  step 'I should see login page' do
    expect(page).to have_current_path('/users/sign_in')
  end

  step "I fill out correct email" do
    fill_in('user[email]', :with => 'lopandya96@gmail.com')
  end

  step "I fill out incorrect email" do
    fill_in('user[email]', :with => 'FALSE@gmail.com')
  end

  step "I fill out correct password" do
    fill_in('user[password]', :with => 'lopandya96')
  end

  step "I fill out incorrect password" do
    fill_in('user[password]', :with => 'FALSE')
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