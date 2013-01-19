class MessagesController < ApplicationController
  
  def new
		@message = Message.new

		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
	end
	
  def create
    @message = Message.new(params[:message])
    if @message.save
      Mailer.contact_email(@message).deliver  #send mail
      flash[:notice] = 'Thank you for your message. We will get back to you shortly.'
      redirect_to contact_path
    else
      render action: "new"
      #flash[:error] = @message.errors.full_messages[1]
      #redirect_to contact_path
    end
  end

end
