Given /^I signed up as "(\w+)" with "(\w+)"$/ do |name, pwd|
  user = User.new({username: name, password: pwd, count: 1})
  user.save
end

When /^I login as "(\w+)" with "(\w+)"$/ do |name, pwd|
  fill_in('username', :with => name)
  fill_in('password', :with => pwd)
  click_button('login_btn')
end

