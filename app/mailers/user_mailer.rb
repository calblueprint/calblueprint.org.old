class UserMailer < ActionMailer::Base
  
  default from: "Blueprint <calblueprint@gmail.com>"
  
  def account_created_email(user, password)
    @user = user
    @password = password
    mail(
      to: "#{user.name} <#{user.email}>",
      subject: "Blueprint account created"
    )
  end
end
