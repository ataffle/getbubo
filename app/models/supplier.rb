class Supplier < ApplicationRecord
  belongs_to :organization
  has_many :commitments
end
