class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: {case_sensitive: false}
   has_many :user_concerts
   has_many :concerts, through: :user_concerts
end
