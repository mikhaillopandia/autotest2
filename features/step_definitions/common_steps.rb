When /^I am on login page/ do
  @login.load
end


When /^I am on home page$/ do
  @login.load
end

When /^I click login$/ do
  @home.menu.login.click
end
