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

ActiveRecord::Schema.define(version: 2020_08_25_050147) do

  create_table "archival_ndsoms", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "trade_indicator"
    t.float "ytm"
    t.float "trade_price"
    t.text "face_value"
    t.text "security_description"
    t.text "isin"
    t.time "trade_time"
    t.date "trade_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "client_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "sector_id"
    t.string "client_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sector_id"], name: "index_client_types_on_sector_id"
  end

  create_table "clients", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "client_type_id"
    t.bigint "sector_id"
    t.bigint "state_id"
    t.bigint "town_id"
    t.string "name"
    t.string "address"
    t.string "pin"
    t.string "phone"
    t.string "email"
    t.string "website"
    t.string "aum"
    t.string "subdomain"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_type_id"], name: "index_clients_on_client_type_id"
    t.index ["sector_id"], name: "index_clients_on_sector_id"
    t.index ["state_id"], name: "index_clients_on_state_id"
    t.index ["town_id"], name: "index_clients_on_town_id"
  end

  create_table "interest_frequencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.integer "frequency"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "issuers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "port_folio_securities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "port_folio_id", null: false
    t.bigint "security_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["port_folio_id"], name: "index_port_folio_securities_on_port_folio_id"
    t.index ["security_id"], name: "index_port_folio_securities_on_security_id"
  end

  create_table "port_folios", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "client_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["client_id"], name: "index_port_folios_on_client_id"
  end

  create_table "rating_agencies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "rating_agency_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "ratings", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "rating"
    t.bigint "rating_agency_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["rating_agency_id"], name: "index_ratings_on_rating_agency_id"
  end

  create_table "sectors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "sector_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "securities", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issuer_id"
    t.bigint "security_type_id"
    t.bigint "interest_frequency_id"
    t.text "security_name"
    t.text "isin"
    t.date "issue_date"
    t.date "maturity_date"
    t.float "outstanding_stock"
    t.text "face_value"
    t.float "coupon_rate"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "rating_id", null: false
    t.bigint "rating_agency_id", null: false
    t.index ["interest_frequency_id"], name: "index_securities_on_interest_frequency_id"
    t.index ["issuer_id"], name: "index_securities_on_issuer_id"
    t.index ["rating_agency_id"], name: "index_securities_on_rating_agency_id"
    t.index ["rating_id"], name: "index_securities_on_rating_id"
    t.index ["security_type_id"], name: "index_securities_on_security_type_id"
  end

  create_table "security_types", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.bigint "issuer_id"
    t.text "security_type_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issuer_id"], name: "index_security_types_on_issuer_id"
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "state_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "towns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
    t.string "town_name"
    t.bigint "state_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["state_id"], name: "index_towns_on_state_id"
  end

  add_foreign_key "port_folio_securities", "port_folios"
  add_foreign_key "port_folio_securities", "securities"
  add_foreign_key "securities", "rating_agencies"
  add_foreign_key "securities", "ratings"
end
