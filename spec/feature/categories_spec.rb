require 'rails_helper'

feature 'Browsing categories' do
  # Given categories
  let!(:category) { Category.create!(name: 'Junk') }

  # show categories
  scenario 'see a list of categories' do
    # When I visit the categories page
    visit categories_path
    # Then the page should have the list of categories
    expect(page).to have_content 'Junk'
  end

  # navigate categories
  scenario "look at a category's articles" do
    # And articles
    @user = User.create(username: 'fake', email: 'fake@fake.fake', password: 'fake')
    @article = category.articles.create(title: 'bike4sale', description: 'its a bike fuck you', price: '50', author: @user)
    # And I am on the categories page
    visit categories_path
    # When I click a category
    click_link('Junk')
    # Then a list of articles should be on the page
    expect(page).to have_content('bike4sale')
    expect(current_path).to eq(category_articles_path(category))
  end

  # show an article
end
