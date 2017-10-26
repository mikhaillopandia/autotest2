Then /^I should see login page$/ do
  expect(@login).to be_displayed
end

When /^I fill out correct email$/ do
  @login.email.set 'lopandya96@gmail.com'
end

When /^I fill out incorrect email$/ do
  @login.email.set 'FALSE@i.ua'
end

When /^I fill out correct password$/ do
  @login.password.set 'lopandya96'
end

When /^I fill out incorrect password$/ do
  @login.password.set 'FALSE'
end

When /^I press enter key$/ do
  @login.password.send_keys :enter
end

Then /^I should be logged in successfully$/ do
  @home.wait_for_login_success
  expect(@home).to have_login_success
end

Then /^I should not be logged in$/ do
  @login.wait_for_login_fail
  expect(@login).to have_login_fail
end
