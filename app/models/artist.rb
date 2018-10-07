class Artist < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	has_many :arts

	validates :name, presence: true, length: 3..32
end
