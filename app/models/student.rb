class Student < ApplicationRecord
  belongs_to :group
  belongs_to :client, :through => :group
  has_many :files, :through => :group
end
