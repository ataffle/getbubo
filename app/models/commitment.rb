class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :supplier

  enum recurrence: { "One off" => 0, "Monthly" => 1 }
  enum payment_method: { "Credit card" => 0, "SEPA" => 1, "Transfer" => 2 }
  enum retrieval_mode: { "Email" => 0, "Online" => 1, "Paper" => 2 }
  enum status: { "Pending invoice" => 0, "Pending payment" => 1, "Paid" => 2 }

  # validate :payment_date_greater_than_due_date
  validates :title, presence: true
  validates :retrieval_mode, presence: true
  validates :amount, presence: true
  validates :payment_method, presence: true
  validates :recurrence, presence: true
  validates :payment_date, presence: true
  validates :due_date, presence: true
  validates :status, presence: true

  mount_uploader :invoice, PhotoUploader

  scope :current_month, -> { where("created_at > ? AND created_at < ?", Time.now.beginning_of_month, Time.now.end_of_month) }
  scope :previous_month, -> { where("created_at > ? AND created_at < ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month) }
  scope :year_to_date, -> { where("created_at > ? AND created_at < ?", Time.now.beginning_of_year, Time.now) }
  scope :paid_commitments, -> { where(status: "Paid") }
  scope :pending_invoice_commitmment, -> { where(status: "Pending invoice") }
  scope :pending_payment_commitments, -> { where(status: "Pending payment") }


  PERIODS = ["Current month", "Previous month", "Year-to-date", "All time"]

  # def payment_date_greater_than_due_date
  #   if payment_date < due_date
  #     errors.add(:payment_date, "can't be before due date")
  #   end
  # end
end

