module CommitmentsHelper
  def commitments_periods_for_select
    Commitment::PERIODS
  end

  def commitments_statuses_for_select
    Commitment.statuses.keys.unshift('Status - all')
  end

  def user_names_for_select
    @users = User.all
    @users_names = []
    @users.each do |user|
      @users_names << user.first_name
    end
    @users_names.unshift('Everybody')
  end

  def link_for_commitment_proceed(commitment_to_be)
    if commitment_to_be.status == "Pending payment"
      link_to 'Paid', commitment_commitment_payment_proceed_path(commitment_to_be)
    else
      link_to 'Postpone', commitment_commitment_postpone_path(commitment_to_be)
    end
  end

end
