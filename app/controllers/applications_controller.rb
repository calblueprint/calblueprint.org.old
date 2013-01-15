class ApplicationsController < ApplicationController
	before_filter :authenticate_user!, :except => :create

	def index
		@applications = Application.order('created_at DESC')
	end

	def create
		@application = Application.new(params[:application])
		if @application.save
			flash[:notice] = "Thanks for submitting your resume!"
		else
			flash[:error] = "You must submit your name with a resume, as a PDF under 1MB."
		end
		redirect_to join_path
	end

	def destroy
		@application = Application.find(params[:id])
		# delete from Dropbox
		@application.resume = nil
		@application.destroy
		redirect_to applications_path
	end

end