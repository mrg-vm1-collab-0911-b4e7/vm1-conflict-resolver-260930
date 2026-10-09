class AddSecurityFlag < ActiveRecord::Migration[8.1]
  def change
    add_index :accounts, :name, unique: true, name: "idx_accounts_name_unique"
  end
end
