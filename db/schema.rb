ActiveRecord::Schema[8.1].define(version: 2026_10_09_010101) do
  create_table "accounts", force: :cascade do |t|
    t.string "name"
    t.boolean "security_flag", default: false
  end

  create_table "settings", force: :cascade do |t|
    t.string "value"
  end
end
