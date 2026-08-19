# This migration comes from plum (originally 20260807160000)
class AddLocalizationToPlumEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :plum_entries, :locale, :string, null: false, default: "en"
    add_reference :plum_entries, :origin, null: true, foreign_key: { to_table: :plum_entries }
    remove_index :plum_entries, [ :site_id, :slug ], if_exists: true
    add_index :plum_entries, [ :site_id, :locale, :slug ], unique: true
    add_index :plum_entries, [ :origin_id, :locale ], unique: true
  end
end
