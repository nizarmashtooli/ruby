class Api::V1::JobPostsController < ApplicationController
  before_action :find_job_post, only: [:show, :update]
  def index
    @job_posts = JobPost.all
    render json: @job_posts
  end

  def show
    render json: @job_post
  end

  def create
    @job_post = JobPost.new(job_post_params)
    if @job_post.save
      render json: @job_post, status: :created
    else
      render json: @job_post.errors, status: :unprocessable_entity
    end
  end

  def update
    if @job_post
      @job_post.update(job_post_params)
      render json: @job_post
    else
      render json: @job_post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @job_post
      @job_post.destroy
      render json: {message: "Destroyed successfully"}, status: :destroyed
    else
      render json: {message: "Not found"}, status: :not_found
    end
  end
  private

  def job_post_params
    params.require(:job_post).permit(:title, :description)
  end

  def find_job_post
    @job_post = JobPost.find(params[:id])
  end
end
