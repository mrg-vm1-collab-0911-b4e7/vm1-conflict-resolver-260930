ActiveRecord::Schema[8.1].define(version: 2026_10_09_010202) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.index ["name"], name: "idx_accounts_name_unique", unique: true
  end

  create_table "settings", force: :cascade do |t|
    t.string "value"
  end
end
