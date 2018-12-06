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

end
