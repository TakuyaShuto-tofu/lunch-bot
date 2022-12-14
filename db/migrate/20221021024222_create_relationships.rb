class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.belongs_to :followed, null: false, foreign_key: {to_table: :users}
      t.belongs_to :follower, null: false, foreign_key: {to_table: :users}
      t.timestamps
    end
    add_index :relationships, %i[followed_id follower_id], unique: true
  end
end
