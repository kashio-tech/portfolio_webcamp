class AddParanoiaToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :deleted_at,	:datetime
  	add_column :users, :status, :integer, default: 0
    add_index :users, :deleted_at
  end
end
