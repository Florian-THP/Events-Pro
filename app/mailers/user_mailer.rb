class UserMailer < ApplicationMailer
  default from: 'triboutflorian@gmail.com'
  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login' # URL de connexion
    mail(to: @user.email, subject: 'Bienvenue chez nous !')
  end
end