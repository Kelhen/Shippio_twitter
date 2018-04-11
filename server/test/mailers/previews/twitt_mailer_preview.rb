# Preview all emails at http://localhost:3000/rails/mailers/twitt_mailer
class TwittMailerPreview < ActionMailer::Preview
  def twitt_mail_preview
    TwittMailer.validation_email('jeremi.colborati@gmail.com', 'etwtw')
  end
end
