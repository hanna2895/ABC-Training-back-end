class Group < ApplicationRecord
  belongs_to :client
  has_many :students
  has_many :files
end
