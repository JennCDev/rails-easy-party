class AddPrimaryKeyToUserEvents < ActiveRecord::Migration[7.1]
  def change
    add_index :user_events, [:event_id, :user_id], unique: true
  end
end
