class Art < ApplicationRecord
	mount_uploader :picture, PictureUploader
end
