class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true

  after_create :send_validation
  def send_validation
    # Sends email to user when user is created.
    TwittMailer.validation_email(self).deliver_now
  end
end
