class RenameColumnAdminsToNumber < ActiveRecord::Migration[5.0]
  def change
    rename_column :tiers, :admins, :number
  end
end
