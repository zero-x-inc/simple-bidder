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

ActiveRecord::Schema.define(version: 20170607234538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "advertisements", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "campaign_id"
    t.string "name"
  end

  create_table "apps", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "external_id"
    t.string "publisher_id"
    t.string "exchange_id"
    t.string "domain"
    t.string "name"
  end

  create_table "campaigns", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "seat_id"
    t.string "name"
  end

  create_table "devices", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "js"
    t.string "os"
    t.string "osv"
    t.string "make"
    t.string "model"
    t.string "external_id"
  end

  create_table "events", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string   "type"
    t.string   "seat_id"
    t.string   "campaign_id"
    t.string   "advertisement_id"
    t.string   "bid_request_id"
    t.string   "exchange_id"
    t.string   "publisher_id"
    t.string   "app_id"
    t.string   "site_id"
    t.string   "device_id"
    t.string   "user_id"
    t.string   "country"
    t.string   "region"
    t.string   "city"
    t.string   "dimension"
    t.string   "make"
    t.string   "model"
    t.string   "os"
    t.string   "osv"
    t.string   "js"
    t.string   "gender"
    t.string   "yob"
    t.integer  "cost"
    t.datetime "timestamp"
  end

  create_table "exchanges", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "canonical_id"
    t.string "name"
  end

  create_table "publishers", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "external_id"
    t.string "exchange_id"
    t.string "name"
  end

  create_table "seats", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "email"
  end

  create_table "sites", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "external_id"
    t.string "publisher_id"
    t.string "exchange_id"
    t.string "domain"
  end

  create_table "users", id: :uuid, default: "uuid_generate_v4()", force: :cascade do |t|
    t.string "exchange_id"
    t.string "external_id"
    t.string "gender"
    t.string "yob"
  end

end
