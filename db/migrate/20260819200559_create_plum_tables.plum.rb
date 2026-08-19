# This migration comes from plum (originally 20260101000001)
class CreatePlumTables < ActiveRecord::Migration[8.0]
  def change
    create_table :plum_sites do |t|
      t.string :name, null: false
      t.string :domain
      t.string :theme_name, null: false, default: "default"
      t.json :settings
      t.json :theme_settings, default: {}, null: false
      t.text :custom_css
      t.string :owner_type
      t.bigint :owner_id
      t.timestamps

      t.index [ :owner_type, :owner_id ], unique: true, name: "index_plum_sites_on_owner"
    end

    create_table :plum_users do |t|
      t.string :email
      t.string :password_digest
      t.integer :role
      t.timestamps

      t.index :email, unique: true
    end

    create_table :plum_site_settings do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }, index: { unique: true }
      t.string :name
      t.string :tagline
      t.string :logo
      t.string :favicon
      t.string :seo_title
      t.string :seo_description
      t.string :theme_name
      t.string :primary_color
      t.string :support_email
      t.timestamps
    end

    create_table :plum_content_types do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :name
      t.string :handle
      t.boolean :singleton
      t.json :blueprint
      t.string :icon
      t.timestamps

      t.index [ :site_id, :handle ], unique: true
    end

    create_table :plum_entries do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.references :content_type, null: false, foreign_key: { to_table: :plum_content_types }
      t.references :author, foreign_key: { to_table: :plum_users }
      t.string :author_name
      t.string :author_email
      t.string :author_gid
      t.string :title
      t.string :slug
      t.integer :status
      t.json :data
      t.datetime :published_at
      t.timestamps

      t.index [ :site_id, :slug ], unique: true
    end

    create_table :plum_globals do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :name
      t.string :handle
      t.json :data
      t.timestamps

      t.index [ :site_id, :handle ], unique: true
    end

    create_table :plum_nav_menus do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :name
      t.string :handle
      t.timestamps

      t.index [ :site_id, :handle ], unique: true
    end

    create_table :plum_nav_items do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.references :nav_menu, null: false, foreign_key: { to_table: :plum_nav_menus }
      t.references :parent, foreign_key: { to_table: :plum_nav_items }
      t.references :entry, foreign_key: { to_table: :plum_entries }
      t.string :label
      t.string :url
      t.integer :position
      t.timestamps
    end

    create_table :plum_assets do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :alt_text
      t.text :caption
      t.string :folder
      t.timestamps
    end

    create_table :plum_form_definitions do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :name
      t.string :handle
      t.json :fields
      t.string :notification_email
      t.timestamps

      t.index [ :site_id, :handle ], unique: true
    end

    create_table :plum_form_submissions do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.references :form_definition, null: false, foreign_key: { to_table: :plum_form_definitions }
      t.json :data
      t.timestamps
    end

    create_table :plum_taxonomies do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.string :name, null: false
      t.string :handle, null: false
      t.string :slug, null: false
      t.timestamps

      t.index [ :site_id, :handle ], unique: true
      t.index [ :site_id, :slug ], unique: true
    end

    create_table :plum_terms do |t|
      t.references :site, null: false, foreign_key: { to_table: :plum_sites }
      t.references :taxonomy, null: false, foreign_key: { to_table: :plum_taxonomies }
      t.string :name, null: false
      t.string :slug, null: false
      t.integer :position, default: 0
      t.timestamps

      t.index [ :taxonomy_id, :slug ], unique: true
    end

    create_table :plum_entry_terms do |t|
      t.references :entry, null: false, foreign_key: { to_table: :plum_entries }
      t.references :term, null: false, foreign_key: { to_table: :plum_terms }

      t.index [ :entry_id, :term_id ], unique: true
    end
  end
end
