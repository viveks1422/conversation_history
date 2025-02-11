class CreateProjects < ActiveRecord::Migration[7.2]
  def change
    create_table :projects do |t|
    	t.string :title, null: false, index: true
    	t.text	 :description
    	t.references :user, index: true
      t.timestamps
    end
  end
end
