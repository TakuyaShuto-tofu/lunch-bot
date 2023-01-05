class ChangeColumnsNotnullAddStores < ActiveRecord::Migration[7.0]
  def change
    change_column :stores, :date, :date, null: false
    change_column :stores, :store_name, :string, null: false
    change_column :stores, :comment, :string, null: false
  end
end
