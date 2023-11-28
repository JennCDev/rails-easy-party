class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string :content
      t.references :todo_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
