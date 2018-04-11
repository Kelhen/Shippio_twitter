class TwittMailer < ApplicationMailer
  def validation_email(user)
    @user = user
    puts "url : http://localhost:8080/validation?email=#{@user.email}&validation_token=#{@user.validation_token}"
    mail(to: @user.email, subject: 'validate you account now')
  end
end
