require 'zipruby'

class FileUploader < CarrierWave::Uploader::Base
  storage :file

  attr_reader :password

  def filename
    "#{random_token}.#{file.extension}" if original_filename.present?
  end

  def asset_host
    'http://localhost:3000'
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :zip_file

  private

    def zip_file(_file = nil)
      zipfile_path = "#{Rails.root}/tmp/#{SecureRandom.hex}.zip"
      @password = SecureRandom.base64(12)

      encrypt_zip(zipfile_path)
      overwrite_file(zipfile_path)
    end

    def encrypt_zip(zipfile_path)
      Zip::Archive.open(zipfile_path, Zip::CREATE) do |zipfile|
        zipfile.add_file(file.filename, file.path)
      end

      Zip::Archive.encrypt(zipfile_path, password)
    end

    def overwrite_file(zipfile_path)
      @file = CarrierWave::SanitizedFile.new(
        tempfile: zipfile_path,
        filename: "#{file.basename}.zip",
        content_type: 'application/zip'
      )
    end

    def random_token
      Digest::MD5.hexdigest([
        model.created_at.to_s.presence || Time.zone.now.to_s,
        model.id
      ].join).last(16)
    end
end
