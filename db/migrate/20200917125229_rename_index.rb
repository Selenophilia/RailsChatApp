class RenameIndex < ActiveRecord::Migration[6.0]
  def change
    rename_column :messages, :chatrooms_id, :chatroom_id
  end
end
