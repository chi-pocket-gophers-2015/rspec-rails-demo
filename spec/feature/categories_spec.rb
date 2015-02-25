require 'rails_helper'

feature 'Browsing categories' do
  let!(:category) { Category.create!(name: 'Fake Category') }
  let!(:user)     { User.create!(email: 'fake', username: 'fake', password: 'fake') }
  let!(:article)  { category.articles.create!(title: "Fake Article", price: 200, author: user) }

  # show categories
  scenario 'shows a list' do
    visit root_path
    expect(page).to have_link("Fake Category")
  end

  # navigate categories
  scenario 'clicks a link' do
    visit root_path
    click_link("Fake Category")
    expect(page).to have_content("Fake Article")
    expect(URI(current_url).path).to eq category_articles_path(category)
  end

  # show an article
  scenario 'displays an article' do
    visit category_article_path(category, article)
    expect(find("h1")).to have_content("Fake Article")
  end
end
