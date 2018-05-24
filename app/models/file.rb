class Files < ApplicationRecord
  belongs_to :group
  belongs_to :student, :through => :group
end
