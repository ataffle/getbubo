class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  make_private
  # def filename
  #   "#{model.invoice_ref}" if original_filename.present?
  # end

  def filename
   "#{model.invoice_ref}"
  end

  def public_id
    return model.invoice_ref
  end
end
