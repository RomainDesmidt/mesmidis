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

ActiveRecord::Schema.define(version: 20170320143010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "restaurant_id"
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_meals_on_category_id", using: :btree
    t.index ["restaurant_id"], name: "index_meals_on_restaurant_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "meal_id"
    t.date     "date"
    t.string   "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["meal_id"], name: "index_orders_on_meal_id", using: :btree
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "restaurants", force: :cascade do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.integer  "time_slot"
    t.integer  "monday_meal_id"
    t.integer  "monday_meal_count"
    t.integer  "tuesday_meal_id"
    t.integer  "tuesday_meal_count"
    t.integer  "wednesday_meal_id"
    t.integer  "wednesday_meal_count"
    t.integer  "thursday_meal_id"
    t.integer  "thursday_meal_count"
    t.integer  "friday_meal_id"
    t.integer  "friday_meal_count"
    t.string   "picture"
    t.float    "latitude"
    t.float    "longitude"
    t.index ["email"], name: "index_restaurants_on_email", unique: true, using: :btree
    t.index ["friday_meal_id"], name: "index_restaurants_on_friday_meal_id", using: :btree
    t.index ["monday_meal_id"], name: "index_restaurants_on_monday_meal_id", using: :btree
    t.index ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true, using: :btree
    t.index ["thursday_meal_id"], name: "index_restaurants_on_thursday_meal_id", using: :btree
    t.index ["tuesday_meal_id"], name: "index_restaurants_on_tuesday_meal_id", using: :btree
    t.index ["wednesday_meal_id"], name: "index_restaurants_on_wednesday_meal_id", using: :btree
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.integer  "meals_count"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "user_food_preferences", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_user_food_preferences_on_category_id", using: :btree
    t.index ["user_id"], name: "index_user_food_preferences_on_user_id", using: :btree
  end

  create_table "user_subscriptions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subscription_id"
    t.date     "starting_on"
    t.integer  "price"
    t.integer  "meals_count"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["subscription_id"], name: "index_user_subscriptions_on_subscription_id", using: :btree
    t.index ["user_id"], name: "index_user_subscriptions_on_user_id", using: :btree
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "address"
    t.string   "zip_code"
    t.string   "city"
    t.string   "phone_number"
    t.integer  "time_slot"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "meals", "categories"
  add_foreign_key "meals", "restaurants"
  add_foreign_key "orders", "meals"
  add_foreign_key "orders", "users"
  add_foreign_key "restaurants", "meals", column: "friday_meal_id", on_delete: :nullify
  add_foreign_key "restaurants", "meals", column: "monday_meal_id", on_delete: :nullify
  add_foreign_key "restaurants", "meals", column: "thursday_meal_id", on_delete: :nullify
  add_foreign_key "restaurants", "meals", column: "tuesday_meal_id", on_delete: :nullify
  add_foreign_key "restaurants", "meals", column: "wednesday_meal_id", on_delete: :nullify
  add_foreign_key "user_food_preferences", "categories"
  add_foreign_key "user_food_preferences", "users"
  add_foreign_key "user_subscriptions", "subscriptions"
  add_foreign_key "user_subscriptions", "users"
end
