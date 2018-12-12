class AddDefaultToCommitments < ActiveRecord::Migration[5.2]
  def change
    change_column :commitments, :postponed?, :boolean, default: false
  end
end
