class Art < ApplicationRecord
	mount_uploader :picture, PictureUploader

	belongs_to :artist
end
