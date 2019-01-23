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

ActiveRecord::Schema.define(version: 2019_01_22_045504) do

  create_table "events", force: :cascade do |t|
    t.string "uuid", null: false
    t.datetime "start_time", null: false
    t.datetime "end_time", null: false
    t.integer "duration", null: false
    t.datetime "created_at", null: false
    t.string "location"
    t.boolean "canceled"
    t.string "canceler_name"
    t.string "cancel_reason"
    t.datetime "canceled_at"
  end

end
