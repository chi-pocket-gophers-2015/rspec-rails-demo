require 'rails_helper'

feature 'Users' do
  # create a new user
  scenario 'signing up' do
    # Given a signup form
    visit signup_path
    # When I fill in the fields correctly
    within('#new_user') do
      fill_in 'Username', with: 'fake'
      fill_in 'Email', with: 'fake@fake.fake'
      fill_in 'Password', with: 'fake'
      fill_in 'Password confirmation', with: 'fake'
    end
    # And I submit the form
    click_button 'Create User'
    # Then I should see "Welcome"
    expect(page).to have_content "Welcome fake"
    # Or I should see a sign out button
    expect(page).to have_link "Logout"
  end

  # login
  scenario 'logging in' do
    @user = User.create(username: 'fake', email: 'fake@fake.fake', password: 'fake')
    visit login_path
    within('#login-form') do
      fill_in 'Email', with: 'fake@fake.fake'
      fill_in 'Password', with: 'fake'
    end
    click_button 'Log in'
    expect(page).to have_link "Logout"
  end
end
