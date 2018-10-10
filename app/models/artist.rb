class Artist < ApplicationRecord
	has_many :arts

  	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates :name, presence: true, length: 3..32 , uniqueness: true
	validates :password, presence: true, length: 6..32
	validates :email, presence: true, length: 3..32, uniqueness: true
	validates :phone, presence: true, uniqueness: true
end
