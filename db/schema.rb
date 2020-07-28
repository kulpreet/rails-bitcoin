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

ActiveRecord::Schema.define(version: 2020_07_28_170142) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "address", limit: 35, null: false
    t.datetime "last_fetched_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "hash160"
    t.integer "n_tx"
    t.bigint "total_received"
    t.bigint "total_sent"
    t.bigint "final_balance"
    t.index ["address"], name: "index_addresses_on_address"
    t.index ["hash160"], name: "index_addresses_on_hash160"
  end

  create_table "addresses_btc_transactions", id: false, force: :cascade do |t|
    t.bigint "address_id"
    t.bigint "btc_transaction_id"
    t.index ["address_id"], name: "index_addresses_btc_transactions_on_address_id"
    t.index ["btc_transaction_id"], name: "index_addresses_btc_transactions_on_btc_transaction_id"
  end

  create_table "btc_transactions", force: :cascade do |t|
    t.boolean "double_spend", default: false
    t.integer "block_height", null: false
    t.integer "time", null: false
    t.string "relayed_by"
    t.string "tx_hash", null: false
    t.integer "tx_index", null: false
    t.integer "version", null: false
    t.integer "size", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inputs", force: :cascade do |t|
    t.integer "n"
    t.bigint "value"
    t.integer "tx_index"
    t.integer "input_type"
    t.string "script"
    t.string "script_sig"
    t.bigint "sequence"
    t.bigint "address_id", null: false
    t.bigint "btc_transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_inputs_on_address_id"
    t.index ["btc_transaction_id"], name: "index_inputs_on_btc_transaction_id"
  end

  create_table "outputs", force: :cascade do |t|
    t.integer "n"
    t.bigint "value"
    t.integer "tx_index"
    t.string "script"
    t.boolean "spent"
    t.bigint "address_id", null: false
    t.bigint "btc_transaction_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_id"], name: "index_outputs_on_address_id"
    t.index ["btc_transaction_id"], name: "index_outputs_on_btc_transaction_id"
  end

  add_foreign_key "inputs", "addresses"
  add_foreign_key "inputs", "btc_transactions"
  add_foreign_key "outputs", "addresses"
  add_foreign_key "outputs", "btc_transactions"
end
