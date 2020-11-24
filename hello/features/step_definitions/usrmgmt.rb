#For Sign Up

Given('I am not authenticated') do
  visit('/users/sign_out')
end

When('I goto the Signup page') do
  visit('/users/sign_up')
end

When('I fill in {string} with {string}') do |string, string2|
  fill_in string, with: string2
end

When('I press {string}') do |string|
  click_button string
end

Then('I should see {string}') do |string|
  expect(page).to have_content  string #'Welcome! You have signed up successfully.'
end

Then('I should not see {string}') do |string|
  expect(page).to have_no_content string
end

############
#For Sign In
############
Given('I am not signed in') do
  visit('/users/sign_out')
end

When('I visit the sign in page') do
  visit ('/users/sign_in')
end

When('I fill in the form and press {string} button') do |string|
  @user = FactoryBot.create :user
  fill_in 'Email', with: @user.email
  fill_in 'Password', with: @user.password
  click_button string
end

Then('I should not see {string} and {string}') do |string, string2|
  expect(page).to have_no_content string
  expect(page).to have_no_content string2
end
