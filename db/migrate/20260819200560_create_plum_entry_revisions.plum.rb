# This migration comes from plum (originally 20260807130000)
class CreatePlumEntryRevisions < ActiveRecord::Migration[8.0]
  def change
    create_table :plum_entry_revisions do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.references :entry, null: false, foreign_key: { to_table: :plum_entries }
      t.references :editor, null: true, foreign_key: { to_table: :plum_users }
      t.string :editor_name
      t.string :editor_email
      t.string :editor_gid
      t.json :snapshot, null: false, default: {}
      t.timestamps
    end

    add_index :plum_entry_revisions, [ :entry_id, :created_at ]
  end
end
