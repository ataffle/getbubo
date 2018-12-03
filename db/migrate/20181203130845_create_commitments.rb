class CreateCommitments < ActiveRecord::Migration[5.2]
  def change
    create_table :commitments do |t|
      t.string :title
      t.string :order_ref
      t.references :user, foreign_key: true
      t.references :supplier, foreign_key: true
      t.text :description
      t.integer :amount
      t.integer :recurrence
      t.integer :payment_method
      t.integer :retrieval_mode
      t.string :due_date
      t.string :payment_date
      t.integer :status

      t.timestamps
    end
  end
end
