module CommitmentsHelper
  def commitments_periods_for_select
    Commitment::PERIODS
  end

  def commitments_statuses_for_select
    Commitment.statuses.keys.unshift('Tous statuts')
  end

  def user_names_for_select
    @users = User.all
    @users_names = []
    @users.each do |user|
      @users_names << user.first_name
    end
    @users_names.unshift('Tous')
  end

  def link_for_commitment_proceed(commitment_to_be)
    if commitment_to_be.status == "Paiement en attente"
      link_to commitment_commitment_payment_proceed_path(commitment_to_be) do
        content_tag(:i, "", class: "fas fa-credit-card")
      end
    else
      link_to commitment_commitment_postpone_path(commitment_to_be) do
        content_tag(:i, "", class: "fas fa-arrow-circle-right")
      end
    end
  end

end
