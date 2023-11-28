class AddEventRefToUserEvents < ActiveRecord::Migration[7.1]
  def change
    add_reference :user_events, :event, null: false, foreign_key: true
  end
end
