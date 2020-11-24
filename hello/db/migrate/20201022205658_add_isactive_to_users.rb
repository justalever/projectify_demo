class AddIsactiveToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :is_active, :boolean, null: false, default: true
  end
end
