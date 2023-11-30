class AddEventRefToTodoLists < ActiveRecord::Migration[7.1]
  def change
    add_reference :todo_lists, :event, null: false, foreign_key: true
  end
end
