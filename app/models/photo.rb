class Photo < ActiveRecord::Base
  belongs_to :recipe

  mount_uploader :image, ImageUploader
end
