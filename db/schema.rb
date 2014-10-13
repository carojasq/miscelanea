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

ActiveRecord::Schema.define(version: 20141013214519) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "categories", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "documents", force: true do |t|
    t.string   "name"
    t.date     "valid_until"
    t.string   "document_file_file_name"
    t.string   "document_file_content_type"
    t.integer  "document_file_file_size"
    t.datetime "document_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "egresses", force: true do |t|
    t.string   "description"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "seller_id"
  end

  add_index "egresses", ["seller_id"], name: "index_egresses_on_seller_id"

  create_table "order_lines", force: true do |t|
    t.integer  "order_id"
    t.integer  "sale_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.float    "final_unit_price"
    t.float    "final_total_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_lines", ["order_id"], name: "index_order_lines_on_order_id"
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id"
  add_index "order_lines", ["sale_id"], name: "index_order_lines_on_sale_id"

  create_table "orders", force: true do |t|
    t.integer  "seller_id"
    t.boolean  "paid",       default: false
    t.datetime "paid_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["seller_id"], name: "index_orders_on_seller_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.integer  "quantity"
    t.integer  "provider_id"
    t.integer  "category_id"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["category_id"], name: "index_products_on_category_id"
  add_index "products", ["provider_id"], name: "index_products_on_provider_id"

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "telephone"
    t.string   "address"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sales", force: true do |t|
    t.integer  "value"
    t.integer  "seller_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["seller_id"], name: "index_sales_on_seller_id"

  create_table "sellers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
  end

  add_index "sellers", ["email"], name: "index_sellers_on_email", unique: true
  add_index "sellers", ["reset_password_token"], name: "index_sellers_on_reset_password_token", unique: true

end
