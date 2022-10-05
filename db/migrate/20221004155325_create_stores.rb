class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores do |t|
      t.date :date
      t.string :store_name
      t.string :comment

      t.timestamps
    end
  end
end
