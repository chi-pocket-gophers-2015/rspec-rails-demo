require 'rails_helper'

describe CategoriesController do
  # test for fun
  it 'renders the index view' do
    get :index
    expect(response.status).to eq 200
  end

  # test that returns JSON with response parsing
  it 'renders categories as JSON' do
    category = Category.new(name: 'Fake Category')
    expect(Category).to receive(:order).and_return([category])

    get :index, format: :json
    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.length).to eq(1)
  end

  # test a 404
  # test a redirect
  # test a POST
end
