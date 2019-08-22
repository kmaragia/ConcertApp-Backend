class Concert < ApplicationRecord
  has_many :user_concerts, dependent: :destroy
  has_many :users, through: :user_concerts, dependent: :destroy
end
