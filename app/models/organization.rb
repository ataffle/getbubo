class Organization < ApplicationRecord
  has_many :users
  has_many :commitments, through: :users
  has_many :suppliers
end
