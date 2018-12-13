class AddDefaultValueToInvoice < ActiveRecord::Migration[5.2]
  def change
    change_column :commitments, :invoice, :string, default: nil
  end
end
