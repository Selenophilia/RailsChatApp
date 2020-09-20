class Messages < ActiveRecord::Migration[6.0]
  def change
    add_reference :messages, :conversation, index: true
  end
end
