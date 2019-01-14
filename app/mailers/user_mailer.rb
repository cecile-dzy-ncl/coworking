class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome(request)
    @request = request # Instance variable => available in view

    mail(to: @request.email, subject: "Coworking | Confirmez votre inscription à la liste d'attente")
    # This will render a view in `app/views/user_mailer`!
  end

  def confirmation(request)
    @request = request # Instance variable => available in view

    mail(to: @request.email, subject: "Coworking | Toujours intéressé-e par une place ?")
    # This will render a view in `app/views/user_mailer`!
  end
end
