Before do |scenario|
  @login ||= Login.new
  @home ||= Home.new
end

After do |scenario|
  Capybara.reset_sessions!
end