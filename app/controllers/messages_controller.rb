class MessagesController < ApplicationController

  def create
    @message = Message.new(params[:message])
    if @message.save
      Mailer.contact_email(@message).deliver  #send mail
      flash[:notice] = 'Thank you for your message. We will get back to you shortly.'
      redirect_to contact_path
    else
      flash[:error] = 'Something went wrong!'
      redirect_to contact_path
    end
  end

end
