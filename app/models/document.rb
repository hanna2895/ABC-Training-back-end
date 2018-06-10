class Document < ApplicationRecord
  belongs_to :file
  mount_uploader :document, DocumentUploader
end
