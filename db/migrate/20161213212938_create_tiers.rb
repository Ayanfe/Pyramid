class CreateTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :tiers do |t|
      t.integer :admins
      t.boolean :bottom

      t.timestamps
    end
  end
end
