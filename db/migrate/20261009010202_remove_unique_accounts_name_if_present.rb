class RemoveUniqueAccountsNameIfPresent < ActiveRecord::Migration[8.1]
  def change
    remove_index :accounts, name: "idx_accounts_name_unique", if_exists: true
  end
end
