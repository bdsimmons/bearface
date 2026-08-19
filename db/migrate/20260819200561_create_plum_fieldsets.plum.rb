# This migration comes from plum (originally 20260807140000)
class CreatePlumFieldsets < ActiveRecord::Migration[8.0]
  def change
    create_table :plum_fieldsets do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :name, null: false
      t.string :handle, null: false
      t.json :fields, null: false, default: []
      t.timestamps
    end

    add_index :plum_fieldsets, [ :site_id, :handle ], unique: true
  end
end
