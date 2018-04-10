class Twitt < ApplicationRecord
  belongs_to :user

  # validates :postedById, presence: true
  validates :twitt, presence: true, length: { maximum: 140 }
end
