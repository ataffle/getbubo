class ChangeDueDateToBeDateTimeInCommitments < ActiveRecord::Migration[5.2]
  def change
    change_column :commitments, :due_date, 'date USING CAST(due_date AS date)'
    change_column :commitments, :payment_date, 'date USING CAST(payment_date AS date)'
  end
end
