Before do |scenario|
  @login ||= LoginPage.new
  @home ||= HomePage.new
end

After do |scenario|
  Capybara.reset_sessions!
end