class Files < ApplicationRecord
  belongs_to :group
  belongs_to :student
  has_one_attached :document
end
