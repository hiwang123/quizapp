class Question < ActiveRecord::Base
	mount_uploader :attachment1, AttachmentUploader
	mount_uploader :attachment2, AttachmentUploader
	belongs_to :test
end
