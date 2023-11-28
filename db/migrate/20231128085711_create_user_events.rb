class CreateUserEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :user_events do |t|
      t.boolean :planner
      t.string :status

      t.timestamps
    end
  end
end
