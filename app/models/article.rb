class Article < ActiveRecord::Base
  belongs_to :category
  belongs_to :author, class_name: "User"

  validates  :author, :category, :title, presence: true
end
