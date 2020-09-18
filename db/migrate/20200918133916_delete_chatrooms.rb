class DeleteChatrooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :chatroom_id
    
    drop_table :chatrooms
  end
end
