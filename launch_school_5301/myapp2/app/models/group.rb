class Group < ApplicationRecord
  has_many :users
  has_many :users, through: :user_groups
end