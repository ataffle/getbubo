class Organization < ApplicationRecord
  has_many :users
  has_many :commitments
  has_many :suppliers
end
