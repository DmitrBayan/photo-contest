# frozen_string_literal: true

class PhotoUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick
  process resize_to_limit: [400, 400]

  #  if Rails.env.production?
  #    storage :fog
  #  else
  #    storage :file
  #  end

  storage :file
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  version :admin do
    process resize_to_limit: [100, 100]
  end

  version :show do
    process resize_to_limit: [400, 400]
  end

end
