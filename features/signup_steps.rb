Given /^I am on my homepage$/ do
  visit root_path  
end

When /^I signup as "(\w+)" with "(\w+)"$/ do |name, pwd|
  fill_in('username', :with => name)
  fill_in('password', :with => pwd)
  click_button('signup_btn')
end

Then /^I see my counter$/ do
  assert page.has_content?("You have logged in")
  # this won't work if you got the 'Firefox Driver' error
  # erase or comment out the line for now
end
