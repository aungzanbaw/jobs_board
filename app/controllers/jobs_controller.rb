class JobsController < ApplicationController
	before_action :set_job, only: [:show, :update, :edit, :destroy]

	def index
		@jobs = Job.all.order("created_at DESC")
	end

	def show
	
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(jobs_params)
		if @job.save
			redirect_to @job
		else
			render "new"
		end
	end

	def edit
	end

	def update
		if @job.update(jobs_params)
			redirect_to @job
		else
			render "edit"
		end
	end


	def destroy
		if @job.destroy
			redirect_to root_path
		else
			render "show"
			flash[:notice] = "Can't delete the record"
		end
	end

	private
		def set_job
			@job = Job.find(params[:id])
		end

		def jobs_params
			params.require(:job).permit(:title, :description, :company, :url)
		end

end