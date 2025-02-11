class CreateComments < ActiveRecord::Migration[7.2]
  def change
    create_table :comments do |t|
      t.string :message
      t.references :user, null: false, index: true
      t.references :project, null: false, index: true
      t.timestamps
    end
  end
end
