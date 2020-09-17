class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :users
      t.string :message_body

      t.timestamps
    end
  end
end
