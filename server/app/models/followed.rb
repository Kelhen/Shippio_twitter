class Followed < ApplicationRecord
  belongs_to :user, class_name: 'User'
  # belongs_to :follower, class_name: 'User'
  # has_many :users, class_name: 'User', foreign_key: 'user_id'
end
