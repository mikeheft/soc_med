# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_06_05_151450) do

  create_table "soc_med_blocks", force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_soc_med_blocks_on_owner_type_and_owner_id"
    t.index ["target_id", "target_type", "owner_id", "owner_type"], name: "idx_soc_med_blocks_on_target_and_owner", unique: true
    t.index ["target_type", "target_id"], name: "index_soc_med_blocks_on_target_type_and_target_id"
  end

  create_table "soc_med_follows", force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_soc_med_follows_on_owner_type_and_owner_id"
    t.index ["target_id", "target_type", "owner_id", "owner_type"], name: "idx_soc_med_follows_on_target_and_owner", unique: true
    t.index ["target_type", "target_id"], name: "index_soc_med_follows_on_target_type_and_target_id"
  end

  create_table "soc_med_likes", force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_soc_med_likes_on_owner_type_and_owner_id"
    t.index ["target_id", "target_type", "owner_id", "owner_type"], name: "idx_soc_med_likes_on_target_and_owner", unique: true
    t.index ["target_type", "target_id"], name: "index_soc_med_likes_on_target_type_and_target_id"
  end

  create_table "soc_med_reports", force: :cascade do |t|
    t.string "target_type", null: false
    t.integer "target_id", null: false
    t.string "owner_type", null: false
    t.integer "owner_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["owner_type", "owner_id"], name: "index_soc_med_reports_on_owner_type_and_owner_id"
    t.index ["target_id", "target_type", "owner_id", "owner_type"], name: "idx_soc_med_reports_on_target_and_owner", unique: true
    t.index ["target_type", "target_id"], name: "index_soc_med_reports_on_target_type_and_target_id"
  end

end
