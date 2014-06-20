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

ActiveRecord::Schema.define(version: 20140615213159) do

  create_table "addresses", force: true do |t|
    t.integer  "city_id"
    t.string   "street"
    t.string   "street_no"
    t.string   "apartment_no"
    t.string   "floor"
    t.string   "telephone"
    t.string   "office_no"
    t.string   "building"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["city_id"], name: "index_addresses_on_city_id"

  create_table "advertisements", force: true do |t|
    t.integer  "user_id"
    t.text     "details"
    t.datetime "placement_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertisements", ["user_id"], name: "index_advertisements_on_user_id"

  create_table "advertisers", force: true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "advertisers", ["address_id"], name: "index_advertisers_on_address_id"
  add_index "advertisers", ["user_id"], name: "index_advertisers_on_user_id"

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
  end

  add_index "breeds", ["type_id"], name: "index_breeds_on_type_id"

  create_table "cities", force: true do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cities", ["province_id"], name: "index_cities_on_province_id"

  create_table "countries", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dewormings", force: true do |t|
    t.string   "name"
    t.integer  "treatment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dewormings", ["treatment_id"], name: "index_dewormings_on_treatment_id"

  create_table "losses", force: true do |t|
    t.boolean  "lost"
    t.string   "finder_name"
    t.text     "finder_contact_details"
    t.datetime "date_lost"
    t.string   "place_lost"
    t.datetime "date_found"
    t.string   "place_found"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operations", force: true do |t|
    t.string   "name"
    t.integer  "treatment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "operations", ["treatment_id"], name: "index_operations_on_treatment_id"

  create_table "owners", force: true do |t|
    t.integer  "address_id"
    t.integer  "user_id"
    t.string   "name"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "owners", ["address_id"], name: "index_owners_on_address_id"
  add_index "owners", ["user_id"], name: "index_owners_on_user_id"

  create_table "pet_treatments", force: true do |t|
    t.integer  "medical_history_no"
    t.integer  "pet_id"
    t.integer  "treatment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pet_treatments", ["pet_id"], name: "index_pet_treatments_on_pet_id"
  add_index "pet_treatments", ["treatment_id"], name: "index_pet_treatments_on_treatment_id"

  create_table "pets", force: true do |t|
    t.string   "name"
    t.integer  "owner_id"
    t.datetime "birth_date"
    t.string   "colour"
    t.boolean  "sex"
    t.boolean  "sterilized"
    t.boolean  "available_to_breed"
    t.boolean  "deceased"
    t.datetime "death_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_id"
    t.integer  "breed_id"
  end

  add_index "pets", ["breed_id"], name: "index_pets_on_breed_id"
  add_index "pets", ["owner_id"], name: "index_pets_on_owner_id"
  add_index "pets", ["type_id"], name: "index_pets_on_type_id"

  create_table "pets_losses", force: true do |t|
    t.integer  "loss_history_no"
    t.integer  "pet_id"
    t.integer  "loss_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pets_losses", ["loss_id"], name: "index_pets_losses_on_loss_id"
  add_index "pets_losses", ["pet_id"], name: "index_pets_losses_on_pet_id"

  create_table "provinces", force: true do |t|
    t.string   "name"
    t.integer  "country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "provinces", ["country_id"], name: "index_provinces_on_country_id"

  create_table "sales", force: true do |t|
    t.integer  "pet_id"
    t.float    "price"
    t.boolean  "sold"
    t.datetime "date_sold"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["pet_id"], name: "index_sales_on_pet_id"

  create_table "treatments", force: true do |t|
    t.integer  "veterinarian_id"
    t.datetime "treatment_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "treatments", ["veterinarian_id"], name: "index_treatments_on_veterinarian_id"

  create_table "types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.string   "role"
  end

  create_table "vaccination_types", force: true do |t|
    t.string   "name"
    t.integer  "treatment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vaccination_types", ["treatment_id"], name: "index_vaccination_types_on_treatment_id"

  create_table "veterinarians", force: true do |t|
    t.integer  "address_id"
    t.string   "name"
    t.string   "lastname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "veterinarians", ["address_id"], name: "index_veterinarians_on_address_id"

end
