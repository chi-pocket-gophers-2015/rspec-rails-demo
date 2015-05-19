require 'rails_helper'

describe ArticlesController do
  # show new page with redirect
  it 'redirects you away from a page that needs authentication' do
    get :new
    expect(response).to be_redirect
  end

  context 'with a user' do
    it 'shows you the new page' do
      expect_any_instance_of(ApplicationController).to receive(:logged_in?).and_return(true)
      get :new
      expect(response).to_not be_redirect
    end
  end
  # create an article
end
