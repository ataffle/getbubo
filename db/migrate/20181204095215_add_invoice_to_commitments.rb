class AddInvoiceToCommitments < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :invoice, :string
  end
end
