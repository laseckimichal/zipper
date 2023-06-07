class Api::V1::FilesController < ApplicationController
  expose :user_files, -> { current_user.user_files }
  expose :user_file, parent: :current_user

  def index
    render json: user_files
  end

  def create
    user_file.file = params[:file]
    if user_file.save
      render json: { link: user_file.file.url, password: 'password' }
    else
      render json: { error: 'Failed to upload file.' }, status: :unprocessable_entity
    end
  end

  private

    def user_file_params
      params.permit(:file)
    end
end
