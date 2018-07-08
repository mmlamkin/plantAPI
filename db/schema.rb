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

ActiveRecord::Schema.define(version: 20180708222120) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "gardens", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gardens_plants", id: false, force: :cascade do |t|
    t.bigint "garden_id", null: false
    t.bigint "plant_id", null: false
  end

  create_table "plants", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "optimal_sun"
    t.string "planting_considerations"
    t.string "when_to_plant"
    t.string "growing_from_seed"
    t.string "spacing"
    t.string "watering"
    t.string "other_care"
    t.string "diseases"
    t.string "pests"
    t.string "harvesting"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "idToken"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
