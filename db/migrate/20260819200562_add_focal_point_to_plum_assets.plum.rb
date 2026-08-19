# This migration comes from plum (originally 20260807150000)
class AddFocalPointToPlumAssets < ActiveRecord::Migration[8.0]
  def change
    add_column :plum_assets, :focal_x, :integer, null: false, default: 50
    add_column :plum_assets, :focal_y, :integer, null: false, default: 50
  end
end
