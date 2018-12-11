class Closing < ApplicationRecord
  def self.occurred
    find_by("created_at >= ? AND created_at <= ?", Time.now.beginning_of_month, Time.now.end_of_month)
  end
end
