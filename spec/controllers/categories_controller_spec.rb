require 'rails_helper'

describe CategoriesController do
  # test for fun
  it 'shows a list of categories' do
    expect(Category).to receive(:order).and_return([double])
    get :index
    # expect(response.status).to eq(200)
    expect(assigns(:categories).length).to eq(1)
    expect(response).to render_template(:index)
  end
  # test that returns JSON with response parsing
  # test a 404
  # test a redirect
  # test a POST
end
