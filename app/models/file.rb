class Files < ApplicationRecord
  belongs_to :group
  belongs_to :student, :through => :group
  has_one_attached :document
end
