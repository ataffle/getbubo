class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  make_private
  # def filename
  #   "#{model.invoice_ref}" if original_filename.present?
  # end

  def filename
    if original_filename
      if model && model.read_attribute(mounted_as).present?
        model.read_attribute(mounted_as)
      else
        @name = "#{model.invoice_ref}"
      end
    end
  end

  def public_id
    return model.invoice_ref
  end
end
