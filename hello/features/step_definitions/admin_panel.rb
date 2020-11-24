Given('I am an Admin') do
  @admin = FactoryBot.create :admin
end

When('Two new users have registered') do
  @user1 = FactoryBot.create :user
  @user2 = FactoryBot.create :user
  @users = [@user1, @user2]

end


Given('I am logged in') do
  visit('/users/sign_out')
  visit('/users/sign_in')
  fill_in 'Email', with: @admin.email
  fill_in 'Password', with: @admin.password
  click_button 'Log in'
  expect(page).to have_content "Admin Panel"
end

When('I visit Admin Panel') do
  visit('/admin_panel')
end

Then('I should see list of registered users') do
  for user in @users do
    expect(page).to have_content user.username
  end
end

Then('I should see user statistics') do
  expect(page).to have_selector(:css, "#chart-1")
  expect(page).to have_selector(:css, "#chart-2")
end

When('I can ban a user and see success message') do
  @uid1 = @user1.id
  visit('/admin_panel?uid='+@user1.id.to_s)
  #click_link page.first("Ban")
  expect(page).to have_content "User has been banned"
end

Then('I can activate a user and see success message') do
  visit('/admin_panel?uid='+@user1.id.to_s)
  #click_link "Activate"
  expect(page).to have_content "User has been activated"
end