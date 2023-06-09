class Api::V1::FilesController < ApplicationController
  def index
    render json: user_files
  end

  def create
    user_file = current_user.user_files.new(file: params[:file])

    if user_file.save
      render json: { link: user_file.file.url, password: user_file.file.password }
    else
      render json: { error: 'Failed to upload file.' }, status: :unprocessable_entity
    end
  end

  private

    def user_files
      current_user.user_files
    end

    def user_file_params
      params.permit(:file)
    end
end
