class AddUserIdToFriands < ActiveRecord::Migration[6.1]
  def change
    add_column :friands, :user_id, :integer
    add_index :friands, :user_id
  end
end
