class AddSecurityFlag < ActiveRecord::Migration[8.1]
  def change
    add_column :accounts, :security_flag, :boolean, default: false
  end
end
