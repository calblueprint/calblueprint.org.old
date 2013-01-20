class EventsController < ApplicationController

#displays all created events (aka 'list')
def index
	@events = Event.order('created_at DESC')
end

#displays a specfic event	
def show

end

#redirects to page where you can specify data about a new event
def new
	@event = Event.new
end

#actually creates a new event
def create
	@event = Event.new(params[:event])

	respond_to do |format|
      if @event.save
        flash[:notice] = "Thank you for your submission"
        format.html { redirect_to(:action => 'index') }
        #format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        #format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
end

#deletes a previously created event
def destroy
	@event = Event.find(params[:id])
	# delete from Dropbox
	@event.destroy
	redirect_to(:action => 'index')
end

def edit
	@event = Event.find(params[:id])
end

def update
	@event = Event.find(params[:id])
	if @event.update_attributes(params[:event])
		redirect_to(:action => 'index')
	else
		render('edit')
	end
end

end