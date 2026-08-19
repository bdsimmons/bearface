# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_08_19_200564) do
  create_table "plum_assets", force: :cascade do |t|
    t.string "alt_text"
    t.text "caption"
    t.datetime "created_at", null: false
    t.integer "focal_x", default: 50, null: false
    t.integer "focal_y", default: 50, null: false
    t.string "folder"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_plum_assets_on_site_id"
  end

  create_table "plum_content_types", force: :cascade do |t|
    t.json "blueprint"
    t.datetime "created_at", null: false
    t.string "handle"
    t.string "icon"
    t.string "name"
    t.boolean "singleton"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "handle"], name: "index_plum_content_types_on_site_id_and_handle", unique: true
    t.index ["site_id"], name: "index_plum_content_types_on_site_id"
  end

  create_table "plum_entries", force: :cascade do |t|
    t.string "author_email"
    t.string "author_gid"
    t.integer "author_id"
    t.string "author_name"
    t.integer "content_type_id", null: false
    t.datetime "created_at", null: false
    t.json "data"
    t.json "draft_data"
    t.string "locale", default: "en", null: false
    t.integer "origin_id"
    t.datetime "published_at"
    t.integer "site_id", null: false
    t.string "slug"
    t.integer "status"
    t.string "title"
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_plum_entries_on_author_id"
    t.index ["content_type_id"], name: "index_plum_entries_on_content_type_id"
    t.index ["origin_id", "locale"], name: "index_plum_entries_on_origin_id_and_locale", unique: true
    t.index ["origin_id"], name: "index_plum_entries_on_origin_id"
    t.index ["site_id", "locale", "slug"], name: "index_plum_entries_on_site_id_and_locale_and_slug", unique: true
    t.index ["site_id"], name: "index_plum_entries_on_site_id"
  end

  create_table "plum_entry_revisions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "editor_email"
    t.string "editor_gid"
    t.integer "editor_id"
    t.string "editor_name"
    t.integer "entry_id", null: false
    t.integer "site_id", null: false
    t.json "snapshot", default: {}, null: false
    t.datetime "updated_at", null: false
    t.index ["editor_id"], name: "index_plum_entry_revisions_on_editor_id"
    t.index ["entry_id", "created_at"], name: "index_plum_entry_revisions_on_entry_id_and_created_at"
    t.index ["entry_id"], name: "index_plum_entry_revisions_on_entry_id"
    t.index ["site_id"], name: "index_plum_entry_revisions_on_site_id"
  end

  create_table "plum_entry_terms", force: :cascade do |t|
    t.integer "entry_id", null: false
    t.integer "term_id", null: false
    t.index ["entry_id", "term_id"], name: "index_plum_entry_terms_on_entry_id_and_term_id", unique: true
    t.index ["entry_id"], name: "index_plum_entry_terms_on_entry_id"
    t.index ["term_id"], name: "index_plum_entry_terms_on_term_id"
  end

  create_table "plum_fieldsets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "fields", default: [], null: false
    t.string "handle", null: false
    t.string "name", null: false
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "handle"], name: "index_plum_fieldsets_on_site_id_and_handle", unique: true
    t.index ["site_id"], name: "index_plum_fieldsets_on_site_id"
  end

  create_table "plum_form_definitions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "fields"
    t.string "handle"
    t.string "name"
    t.string "notification_email"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "handle"], name: "index_plum_form_definitions_on_site_id_and_handle", unique: true
    t.index ["site_id"], name: "index_plum_form_definitions_on_site_id"
  end

  create_table "plum_form_submissions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "data"
    t.integer "form_definition_id", null: false
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["form_definition_id"], name: "index_plum_form_submissions_on_form_definition_id"
    t.index ["site_id"], name: "index_plum_form_submissions_on_site_id"
  end

  create_table "plum_globals", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.json "data"
    t.string "handle"
    t.string "name"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "handle"], name: "index_plum_globals_on_site_id_and_handle", unique: true
    t.index ["site_id"], name: "index_plum_globals_on_site_id"
  end

  create_table "plum_nav_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "entry_id"
    t.string "label"
    t.integer "nav_menu_id", null: false
    t.integer "parent_id"
    t.integer "position"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.string "url"
    t.index ["entry_id"], name: "index_plum_nav_items_on_entry_id"
    t.index ["nav_menu_id"], name: "index_plum_nav_items_on_nav_menu_id"
    t.index ["parent_id"], name: "index_plum_nav_items_on_parent_id"
    t.index ["site_id"], name: "index_plum_nav_items_on_site_id"
  end

  create_table "plum_nav_menus", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "handle"
    t.string "name"
    t.integer "site_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "handle"], name: "index_plum_nav_menus_on_site_id_and_handle", unique: true
    t.index ["site_id"], name: "index_plum_nav_menus_on_site_id"
  end

  create_table "plum_site_settings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "favicon"
    t.string "logo"
    t.string "name"
    t.string "primary_color"
    t.string "seo_description"
    t.string "seo_title"
    t.integer "site_id", null: false
    t.string "support_email"
    t.string "tagline"
    t.string "theme_name"
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_plum_site_settings_on_site_id", unique: true
  end

  create_table "plum_sites", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.text "custom_css"
    t.string "domain"
    t.string "name", null: false
    t.bigint "owner_id"
    t.string "owner_type"
    t.json "settings"
    t.string "theme_name", default: "default", null: false
    t.json "theme_settings", default: {}, null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_plum_sites_on_owner", unique: true
  end

  create_table "plum_taxonomies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "handle", null: false
    t.string "name", null: false
    t.integer "site_id", null: false
    t.string "slug", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id", "handle"], name: "index_plum_taxonomies_on_site_id_and_handle", unique: true
    t.index ["site_id", "slug"], name: "index_plum_taxonomies_on_site_id_and_slug", unique: true
    t.index ["site_id"], name: "index_plum_taxonomies_on_site_id"
  end

  create_table "plum_terms", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.integer "position", default: 0
    t.integer "site_id", null: false
    t.string "slug", null: false
    t.integer "taxonomy_id", null: false
    t.datetime "updated_at", null: false
    t.index ["site_id"], name: "index_plum_terms_on_site_id"
    t.index ["taxonomy_id", "slug"], name: "index_plum_terms_on_taxonomy_id_and_slug", unique: true
    t.index ["taxonomy_id"], name: "index_plum_terms_on_taxonomy_id"
  end

  create_table "plum_users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "password_digest"
    t.integer "role"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_plum_users_on_email", unique: true
  end

  add_foreign_key "plum_assets", "plum_sites", column: "site_id"
  add_foreign_key "plum_content_types", "plum_sites", column: "site_id"
  add_foreign_key "plum_entries", "plum_content_types", column: "content_type_id"
  add_foreign_key "plum_entries", "plum_entries", column: "origin_id"
  add_foreign_key "plum_entries", "plum_sites", column: "site_id"
  add_foreign_key "plum_entries", "plum_users", column: "author_id"
  add_foreign_key "plum_entry_revisions", "plum_entries", column: "entry_id"
  add_foreign_key "plum_entry_revisions", "plum_sites", column: "site_id"
  add_foreign_key "plum_entry_revisions", "plum_users", column: "editor_id"
  add_foreign_key "plum_entry_terms", "plum_entries", column: "entry_id"
  add_foreign_key "plum_entry_terms", "plum_terms", column: "term_id"
  add_foreign_key "plum_fieldsets", "plum_sites", column: "site_id"
  add_foreign_key "plum_form_definitions", "plum_sites", column: "site_id"
  add_foreign_key "plum_form_submissions", "plum_form_definitions", column: "form_definition_id"
  add_foreign_key "plum_form_submissions", "plum_sites", column: "site_id"
  add_foreign_key "plum_globals", "plum_sites", column: "site_id"
  add_foreign_key "plum_nav_items", "plum_entries", column: "entry_id"
  add_foreign_key "plum_nav_items", "plum_nav_items", column: "parent_id"
  add_foreign_key "plum_nav_items", "plum_nav_menus", column: "nav_menu_id"
  add_foreign_key "plum_nav_items", "plum_sites", column: "site_id"
  add_foreign_key "plum_nav_menus", "plum_sites", column: "site_id"
  add_foreign_key "plum_site_settings", "plum_sites", column: "site_id"
  add_foreign_key "plum_taxonomies", "plum_sites", column: "site_id"
  add_foreign_key "plum_terms", "plum_sites", column: "site_id"
  add_foreign_key "plum_terms", "plum_taxonomies", column: "taxonomy_id"
end
