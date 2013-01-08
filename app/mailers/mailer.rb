class Mailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.contact_email.subject
  #
  def contact_email
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
