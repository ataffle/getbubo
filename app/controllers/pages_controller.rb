class PagesController < ApplicationController
  after_action :verify_authorized, except: [:home, :team]

  def home
    @commitments = Commitment.all
    @unpaid_commitments_amount = @commitments.unpaid_commitments

    filters = params[:filters]

    if filters
      @period = filters[:period]
    else
      @period = "Mois en cours"
    end

    case @period
    when "Mois précédent"
      @commitments = @commitments.previous_month
    when "Mois suivant"
      @commitments = @commitments.next_month
    when "Mois en cours"
      @commitments = @commitments.current_month
    when "Cumul annuel"
      @commitments = @commitments.year_to_date
    when "Toutes périodes"
      @commitments = @commitments
    end

    @statuses = @commitments.map do |commitment|
      commitment.status
    end

    @current_period_commitments = @commitments
    @paid_commitment_amount = @commitments.paid_commitments
    @pending_invoice_amount = @commitments.pending_invoice_commitmment
    @pending_payment_amount = @commitments.pending_payment_commitments

  end

  def team
    @users = current_user.organization.users
  end

end
