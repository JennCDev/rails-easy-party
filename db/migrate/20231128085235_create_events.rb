class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :start_at
      t.date :end_at
      t.string :place

      t.timestamps
    end
  end
end
