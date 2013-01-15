class ApplicationsController < ApplicationController
	before_filter :authenticate_user!, :except => :create

	def index
		@applications = Application.order('created_at DESC')
	end

	def create
		@application = Application.new(params[:application])
		if @application.save
			flash[:notice] = "Resume sent in!"
		else
			flash[:error] = "There was an error uploading your resume."
		end
		redirect_to join_path
	end

	def destroy
		@application = Application.find(params[:id])
		# delete from Dropbox
		@application.resume = nil
		@application.destroy
	end

end