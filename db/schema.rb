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

ActiveRecord::Schema.define(version: 2021_05_22_125256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feedbacks", force: :cascade do |t|
    t.integer "score", null: false
    t.string "touchpoint", null: false
    t.string "respondent_class", limit: 50, null: false
    t.integer "respondent_id", null: false
    t.string "object_class", limit: 50, null: false
    t.integer "object_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["object_class", "object_id"], name: "index_feedbacks_on_object_class_and_object_id"
    t.index ["respondent_class", "respondent_id"], name: "index_feedbacks_on_respondent_class_and_respondent_id"
    t.index ["touchpoint"], name: "index_feedbacks_on_touchpoint"
  end

end
