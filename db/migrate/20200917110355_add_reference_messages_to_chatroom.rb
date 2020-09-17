class AddReferenceMessagesToChatroom < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :chatrooms, foreign_key: true
  end
end
