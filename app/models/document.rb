class Document < ActiveRecord::Base
	has_attached_file :document_file
	#validates :document_file, :attachment_presence => true
	validates :name, uniqueness: true
	validates_attachment :document_file, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "application/pdf"] }

	#validates_date :valid_until, presence: true
end
