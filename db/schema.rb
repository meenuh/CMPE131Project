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

ActiveRecord::Schema.define(version: 20160511011242) do

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "edition"
    t.string   "class_for"
    t.string   "professor"
    t.string   "isbn"
    t.string   "image"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "url"
  end

  add_index "books", ["student_id"], name: "index_books_on_student_id"

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.integer  "no_of_students"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "domain"
  end

  create_table "students", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.string   "university"
    t.string   "major"
    t.integer  "school_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.boolean  "email_confirmed", default: false
    t.string   "confirm_token"
    t.string   "name"
  end

  add_index "students", ["school_id"], name: "index_students_on_school_id"

  create_table "transactions", force: :cascade do |t|
    t.integer  "buyer_id"
    t.integer  "seller_id"
    t.integer  "book_id"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "transactions", ["book_id"], name: "index_transactions_on_book_id"
  add_index "transactions", ["buyer_id"], name: "index_transactions_on_buyer_id"
  add_index "transactions", ["seller_id"], name: "index_transactions_on_seller_id"

end
