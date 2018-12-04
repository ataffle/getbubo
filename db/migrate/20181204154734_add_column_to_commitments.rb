class AddColumnToCommitments < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :invoice_ref, :string
  end
end
