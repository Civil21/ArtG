class Art < ApplicationRecord
	belongs_to :artist
	has_and_belongs_to_many :categories

	has_attached_file :picture, styles: { medium: "250x250>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :picture, content_type: /\Aimage\/.*\z/
end
