class Student < ApplicationRecord
  # belongs_to :group
  has_many :groups
  has_many :clients, :through => :groups
  has_many :files, :through => :groups
  has_secure_password
end
