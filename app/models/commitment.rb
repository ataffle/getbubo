class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :supplier

  enum recurrence: { "One off" => 0, "Monthly" => 1 }
  enum payment_method: { "Credit card" => 0, "SEPA" => 1, "Transfer" => 2 }
  enum retrieval_mode: { "Email" => 0, "Online" => 1, "Paper" => 2 }
  enum status: { "Pending invoice" => 0, "Pending payment" => 1, "Paid" => 2 }

  validates :title, presence: true
  validates :retrieval_mode, presence: true
  validates :description, presence: true
  validates :amount, presence: true
  validates :payment_method, presence: true
  validates :recurrence, presence: true
  validates :payment_date, presence: true
  validates :due_date, presence: true
  validates :status, presence: true
end
