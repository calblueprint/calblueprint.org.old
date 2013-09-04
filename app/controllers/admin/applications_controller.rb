class Admin::ApplicationsController < ApplicationController

  before_filter :activated_user!, except: [:new, :create]
	before_filter :admin_user!, except: [:new, :create]

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
      format.json { render json: @application }
    end
	end

	def create
		@application = Application.new(params[:application])

		respond_to do |format|
      if @application.save
        flash[:notice] = "Thank you for your submission!
                          Be on the lookout for a response from us via email and/or phone!"
        format.html { redirect_to join_path }
        format.json { render json: @application, status: :created, location: @application }
      else
        format.html { render 'new' }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@application = Application.find(params[:id])
		@application.resume = nil
		@application.destroy
		redirect_to admin_applications_path
	end

end
