class User < ActiveRecord::Base
  has_many :articles, foreign_key: :author_id

  validates

  has_secure_password

end
