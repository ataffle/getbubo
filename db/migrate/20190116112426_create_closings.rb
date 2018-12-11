class CreateClosings < ActiveRecord::Migration[5.2]
  def change
    create_table :closings do |t|

      t.timestamps
    end
  end
end
