class UserMailer < ApplicationMailer
  default from: 'taskwhiz.cf@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to TaskWhiz')
  end
end