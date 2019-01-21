class PagesController < ApplicationController
  after_action :verify_authorized, except: [:home, :dashboard, :team]

  def home

  end

  def dashboard
    @commitments = Commitment.all
    @unpaid_commitments_amount = @commitments.unpaid_commitments

    filters = params[:filters]

    if filters
      @period = filters[:period]
    else
      @period = "Mois précédent"
    end

    case @period
    when "Mois précédent"
      @commitments = @commitments.previous_month
      @month = "Novembre"
    when "Mois suivant"
      @commitments = @commitments.next_month
      @month = "Janvier"
    when "Mois en cours"
      @commitments = @commitments.current_month
      @month = "Décembre"
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

    @five_ago = five_ago(Commitment.all)
    @four_ago = four_ago(Commitment.all)
    @three_ago = three_ago(Commitment.all)
    @two_ago = two_ago(Commitment.all)
    @one_ago = one_ago(Commitment.all)
    @current = current_month(Commitment.all)
  end

  # def team
  #   @users = current_user.organization.users
  # end

  private

  def five_ago(commitments)
    array = []
    five_months_ago = commitments.five_months_ago
    five_months_ago.each do |commitment|
      array << commitment.amount
    end
    total_amount = array.sum
    return total_amount
  end

  def four_ago(commitments)
    array = []
    four_months_ago = commitments.four_months_ago
    four_months_ago.each do |commitment|
      array << commitment.amount
    end
    total_amount = array.sum
    return total_amount
  end

  def three_ago(commitments)
    array = []
    three_months_ago = commitments.three_months_ago
    three_months_ago.each do |commitment|
      array << commitment.amount
    end
    total_amount = array.sum
    return total_amount
  end

  def two_ago(commitments)
    array = []
    two_months_ago = commitments.two_months_ago
    two_months_ago.each do |commitment|
      array << commitment.amount
    end
    total_amount = array.sum
    return total_amount
  end

  def one_ago(commitments)
    array = []
    one_month_ago = commitments.one_month_ago
    one_month_ago.each do |commitment|
      array << commitment.amount
    end
    total_amount = array.sum
    return total_amount
  end

  def current_month(commitments)
    array = []
    current_month = commitments.current_month
    current_month.each do |commitment|
      array << commitment.amount
    end
    total_amount = array.sum
    return total_amount
  end

end
