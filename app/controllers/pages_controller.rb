class PagesController < ApplicationController
  after_action :verify_authorized, except: :home

  def home
    @commitments = Commitment.all
    @statuses = @commitments.map do |commitment|
      commitment.status
    end
    @paid_commitment_amount = @commitments.paid_commitments
    @pending_invoice_amount = @commitments.pending_invoice_commitmment
    @pending_payment_amount = @commitments.pending_payment_commitments
  end
end
