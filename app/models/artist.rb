class Artist < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	
	validates :name, presence: true, length: 3..32
end
