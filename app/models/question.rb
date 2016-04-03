class Question < ActiveRecord::Base
	mount_uploader :attachment, AttachmentUploader
	belongs_to :test
end
