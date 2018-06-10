class Files < ApplicationRecord
  belongs_to :group
  belongs_to :student
  mount_uploader :file, FileUploader
  has_many :documents
  attr_accessor :document_data
  # has_one_attached :document
end
