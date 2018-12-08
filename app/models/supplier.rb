class Supplier < ApplicationRecord
  belongs_to :organization
  has_many :commitments
  validates :name, presence: true, uniqueness: true

  def total_payable
    sum = 0
    self.commitments.each do |commitment|
      sum += commitment.amount
    end
    sum
  end

end
