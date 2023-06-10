class Api::V1::JobApplicationsController < ApplicationController
  before_action :find_job_application, only: [:show, :update]
  def index
    @job_applications = JobApplication.all
    render json: @job_applications
  end

  def show
    render json: @job_application
  end

  def create
    @job_application = JobApplication.new(job_application_params)
    if @job_application.save
      render json: @job_application, status: :created
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job_application
      @job_application.update(job_application_update_params)
      render json: @job_application
    else
      render json: @job_application.errors, status: :unprocessable_entity
    end
  end

  # def destroy
  #   if @job_application
  #     @job_application.destroy
  #     render json: {message: "Destroyed successfully"}, status: :destroyed
  #   else
  #     render json: {message: "Not found"}, status: :not_found
  #   end
  # end
  private

  def job_application_params
    params.require(:job_application).permit(:user_id, :job_post_id, :seen)
  end

  def job_application_update_params
    params.require(:job_application).permit(:seen)
  end

  def find_job_application
    @job_application = JobApplication.find(params[:id])
  end
end
