class PagesController < ApplicationController
  after_action :verify_authorized, except: :home

  def home
    @commitments = Commitment.all
    filters = params[:filters]
    @statuses = @commitments.map do |commitment|
      commitment.status
    end
    @current_month_commitments = @commitments.current_month
    @paid_commitment_amount = @commitments.paid_commitments
    @pending_invoice_amount = @commitments.pending_invoice_commitmment
    @pending_payment_amount = @commitments.pending_payment_commitments
    @unpaid_commitments_amount = @commitments.unpaid_commitments
  end
end
