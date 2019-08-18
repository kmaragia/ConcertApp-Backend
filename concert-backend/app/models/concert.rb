class Concert < ApplicationRecord
  has_many :user_concerts
  has_many :users, through: :user_concerts
end
