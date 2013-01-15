class ApplicationsController < ApplicationController
	before_filter :authenticate_user!, :except => [:create, :new]

	def index
		@applications = Application.order('created_at DESC')
	end
	
	def show
    @application = Application.find(params[:id])
	end

	def new
		@application = Application.new
		
		respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
	end

	def create
		@application = Application.new(params[:application])

		respond_to do |format|
      if @application.save
        flash[:notice] = "Thank you for your submission"
        format.html { redirect_to join_path }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render action: "new" }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end

	end

	def destroy
		@application = Application.find(params[:id])
		# delete from Dropbox
		@application.resume = nil
		@application.destroy
		redirect_to applications_path
	end

end