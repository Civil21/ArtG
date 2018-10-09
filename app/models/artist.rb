class Artist < ApplicationRecord
	mount_uploader :avatar, AvatarUploader

	has_many :arts

	validates :name, presence: true, length: 3..32 , uniqueness: true
	validates :password, presence: true, length: 6..32
	validates :email, presence: true, length: 3..32, uniqueness: true
	validates :phone, presence: true, uniqueness: true
end
