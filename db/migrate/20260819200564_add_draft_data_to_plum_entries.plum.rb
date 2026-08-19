# This migration comes from plum (originally 20260811090000)
class AddDraftDataToPlumEntries < ActiveRecord::Migration[8.0]
  def change
    add_column :plum_entries, :draft_data, :json
  end
end
