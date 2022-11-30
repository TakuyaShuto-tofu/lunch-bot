class CreateRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :relationships do |t|
      t.string :followed_id
      t.string :follower_id
      t.timestamps
    end
  end
end
