class EventsController < ApplicationController

#displays all created events (aka 'list')
def index
	@events = Event.order('date DESC')
end

#displays a specfic event	
def show
	@event = Event.find(params[:id])
end

#redirects to page where you can specify data about a new event
def new
	@event = Event.new
end

#actually creates a new event
def create
	@event = Event.new(params[:event])

    if @event.save
      flash[:notice] = "Event Added"
      redirect_to(:action => 'index')
    else
      render action: "new"
    end
end

#deletes a previously created event
def destroy
	@event = Event.find(params[:id])
	flash[:notice] = "Event Deleted"
	@event.destroy
	redirect_to(:action => 'index')
end

#allows you to edit the event
def edit
	@event = Event.find(params[:id])
end

#saves the changes
def update
	@event = Event.find(params[:id])
	if @event.update_attributes(params[:event])
		flash[:notice] = "Event Updated"
		redirect_to(:action => 'index')
	else
		render('edit')
	end
end

def calendar
	@events = Event.find(:all)
	@date = !params[:month].nil? ? Date.parse(params[:month]) : Date.today
end


end