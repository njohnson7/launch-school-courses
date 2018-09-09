class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :user_groups
  has_many :groups, through: :user_groups
end
