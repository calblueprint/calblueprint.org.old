class Mailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.contact_email.subject
  #
  def contact_email(message)
    @message = message
    if @message.inquiry_type == 'client'
      @dest_email = 'callmemc@gmail.com'   # should be Kenneth's email 
    elsif @message.inquiry_type == 'member'
      @dest_email = 'kevinkgong@gmail.com'   # should be KGong's email
    else
      @dest_email = 'michellechow@berkeley.edu'   # should be Jay's email
    end
    
    mail(:to => @dest_email, :from => @message.email, :subject => @message.subject)
    
  end
end
