class CategoriesController < ApplicationController
  respond_to :html, :json
  def index
    respond_with @categories = Category.order(name: :asc)
  end
end
