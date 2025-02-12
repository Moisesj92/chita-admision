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

ActiveRecord::Schema[7.1].define(version: 2024_07_29_214306) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "invoices", force: :cascade do |t|
    t.string "owner_identification"
    t.string "recipient_identification"
    t.decimal "amount", precision: 10, scale: 2
    t.string "invoice_identification"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_identification"], name: "index_invoices_on_invoice_identification", unique: true
  end

  create_table "quotations", force: :cascade do |t|
    t.date "request_date"
    t.float "document_rate"
    t.float "commision"
    t.float "advance_percentage"
    t.decimal "financing_expense", precision: 28, scale: 18
    t.decimal "get_amount", precision: 28, scale: 18
    t.decimal "excess", precision: 28, scale: 18
    t.bigint "invoice_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_quotations_on_invoice_id"
  end

  add_foreign_key "quotations", "invoices"
end
