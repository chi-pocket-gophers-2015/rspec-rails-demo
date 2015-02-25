require 'rails_helper'

describe ArticlesController do
  # show new page with redirect
  it 'redirects from #new when not logged in' do
    get :new
    expect(response).to be_redirect
  end

  # create an article
  context 'when logged in' do
    let!(:user) { User.create!(email: 'fake', username: 'fake', password: 'fake') }
    before do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    end

    it 'renders the new page' do
      get :new
      expect(response).to_not be_redirect
    end

    it 'creates an article' do
      category = Category.create(name: 'Fake Category')
      expect {
        post :create, article: {title: 'Fake Article', price: 500, author_id: user.id, category: category.id}
      }.to change { Article.count }.by(1)
      expect(response).to be_redirect
    end
  end
end
