class AddPostoneToCommitments < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :postponed?, :boolean
  end
end
