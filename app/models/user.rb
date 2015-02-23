class User < ActiveRecord::Base
  has_many :articles, foreign_key: :author_id

  validates :email, :username, presence: true, uniqueness: true

  has_secure_password

end
