class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true

  has_many :followeds, class_name: 'Followed', foreign_key: 'followed_id'

  after_create :send_validation
  def send_validation
    # Sends email to user when user is created.
    TwittMailer.validation_email(self).deliver_now
  end
end
