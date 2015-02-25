require 'rails_helper'

feature 'Users' do
  # create a new user
  scenario 'can be created' do
    visit signup_path
    within("#new_user") do
      fill_in 'Username', with: 'fakeyguy'
      fill_in 'Email', with: 'fake@fakerson.fake'
      fill_in 'Password', with: 'donkey'
      fill_in 'Password confirmation', with: 'donkey'
    end
    click_button 'Create User'
    expect(page).to have_content "Welcome fakeyguy"
  end

  feature 'with an existing user' do
    let!(:user) { User.create!(email: 'fake@fakerson.fake', username: 'fake', password: 'fake') }

    # login
    scenario 'can log in' do
      visit login_path
      within("#login-form") do
        fill_in 'Email', with: 'fake@fakerson.fake'
        fill_in 'Password', with: 'fake'
      end
      click_button "Login"
      expect(page).to have_link("Logout")
    end
  end
end
