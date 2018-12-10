class Commitment < ApplicationRecord
  belongs_to :user
  belongs_to :supplier

  enum recurrence: { "Ponctuel" => 0, "Mensuel" => 1 }
  enum payment_method: { "Carte bancaire" => 0, "SEPA" => 1, "Transfert" => 2 }
  enum retrieval_mode: { "Email" => 0, "En ligne" => 1, "Papier" => 2 }
  enum status: { "Facture en attente" => 0, "Paiement en attente" => 1, "Payé" => 2 }

  # validate :payment_date_greater_than_due_date
  validates :title, presence: true
  validates :retrieval_mode, presence: true
  validates :amount, presence: true
  validates :payment_method, presence: true
  validates :recurrence, presence: true
  validates :due_date, presence: true
  validates :status, presence: true

  mount_uploader :invoice, PhotoUploader

  scope :current_month, -> { where("due_date >= ? AND due_date <= ?", Time.now.beginning_of_month, Time.now.end_of_month) }
  scope :previous_month, -> { where("due_date >= ? AND due_date <= ?", Time.now.prev_month.beginning_of_month, Time.now.prev_month.end_of_month) }
  scope :next_month, -> { where("due_date >= ? AND due_date <= ?", Time.now.next_month.beginning_of_month, Time.now.next_month.end_of_month) }
  scope :year_to_date, -> { where("due_date >= ? AND due_date <= ?", Time.now.beginning_of_year, Time.now) }
  scope :paid_commitments, -> { where(status: "Payé") }
  scope :unpaid_commitments, -> { where.not(status: "Payé") }
  scope :pending_invoice_commitmment, -> { where(status: "Facture en attente") }
  scope :pending_payment_commitments, -> { where(status: "Paiement en attente") }

  PERIODS = ["Mois en cours", "Mois suivant", "Mois précédent", "Cumul annuel", "Toutes périodes"]

  # def payment_date_greater_than_due_date
  #   if payment_date < due_date
  #     errors.add(:payment_date, "can't be before due date")
  #   end
  # end
end





