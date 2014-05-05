class Mailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.contact_email.subject
  #
  def contact_email(message)
    @message = message
    @dest_email = 'team@calblueprint.org'

    mail(:to => @dest_email, :from => @message.email, :subject => @message.subject)

  end
end
