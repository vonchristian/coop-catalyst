# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160508004807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.string   "type"
    t.boolean  "contra"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_accounts_on_type", using: :btree
  end

  create_table "add_type_to_entries", force: :cascade do |t|
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amounts", force: :cascade do |t|
    t.string   "type"
    t.integer  "account_id"
    t.integer  "entry_id"
    t.decimal  "amount",     precision: 10, scale: 2
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["account_id", "entry_id"], name: "index_amounts_on_account_id_and_entry_id", using: :btree
    t.index ["account_id"], name: "index_amounts_on_account_id", using: :btree
    t.index ["entry_id", "account_id"], name: "index_amounts_on_entry_id_and_account_id", using: :btree
    t.index ["entry_id"], name: "index_amounts_on_entry_id", using: :btree
    t.index ["type"], name: "index_amounts_on_type", using: :btree
  end

  create_table "approvals", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "approver_id"
    t.datetime "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["approver_id"], name: "index_approvals_on_approver_id", using: :btree
    t.index ["loan_id"], name: "index_approvals_on_loan_id", using: :btree
  end

  create_table "entries", force: :cascade do |t|
    t.string   "reference_number"
    t.datetime "date"
    t.integer  "entriable_id"
    t.string   "entriable_type"
    t.string   "description"
    t.integer  "recorder_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "type"
    t.index ["entriable_id"], name: "index_entries_on_entriable_id", using: :btree
    t.index ["entriable_type"], name: "index_entries_on_entriable_type", using: :btree
    t.index ["recorder_id"], name: "index_entries_on_recorder_id", using: :btree
  end

  create_table "interest_rates", force: :cascade do |t|
    t.integer  "loan_product_id"
    t.decimal  "rate",            precision: 3, scale: 2
    t.integer  "recurrence"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.index ["loan_product_id"], name: "index_interest_rates_on_loan_product_id", using: :btree
  end

  create_table "loan_fees", force: :cascade do |t|
    t.decimal  "rate"
    t.string   "name"
    t.integer  "loan_product_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["loan_product_id"], name: "index_loan_fees_on_loan_product_id", using: :btree
  end

  create_table "loan_products", force: :cascade do |t|
    t.string   "name"
    t.decimal  "term"
    t.integer  "status",     default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "loans", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "loan_product_id"
    t.decimal  "amount"
    t.datetime "date"
    t.integer  "approval_status", default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["loan_product_id"], name: "index_loans_on_loan_product_id", using: :btree
    t.index ["user_id"], name: "index_loans_on_user_id", using: :btree
  end

  create_table "occupations", force: :cascade do |t|
    t.string   "position"
    t.string   "employer"
    t.string   "employer_address"
    t.string   "contact_number"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_occupations_on_user_id", using: :btree
  end

  create_table "products", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "unit"
    t.decimal  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "role"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_roles_on_user_id", using: :btree
  end

  create_table "share_capitals", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "account_number"
    t.datetime "date_opened"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["user_id"], name: "index_share_capitals_on_user_id", using: :btree
  end

  create_table "stocks", force: :cascade do |t|
    t.decimal  "quantity",   precision: 8, scale: 2
    t.datetime "date"
    t.integer  "product_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.index ["product_id"], name: "index_stocks_on_product_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "type"
    t.integer  "role_id"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["role_id"], name: "index_users_on_role_id", using: :btree
  end

  add_foreign_key "approvals", "loans"
  add_foreign_key "interest_rates", "loan_products"
  add_foreign_key "loan_fees", "loan_products"
  add_foreign_key "loans", "loan_products"
  add_foreign_key "loans", "users"
  add_foreign_key "occupations", "users"
  add_foreign_key "roles", "users"
  add_foreign_key "share_capitals", "users"
  add_foreign_key "stocks", "products"
end
