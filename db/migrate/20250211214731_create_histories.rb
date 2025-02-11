class CreateHistories < ActiveRecord::Migration[7.2]
  def change
    create_table :histories do |t|
      t.string :description
      t.string :conversationable_type, index: true
      t.integer :conversationable_id, index: true

      t.timestamps
    end
  end
end
