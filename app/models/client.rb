class Client < ApplicationRecord
  has_many :groups
  has many :students, :through => :groups
end
