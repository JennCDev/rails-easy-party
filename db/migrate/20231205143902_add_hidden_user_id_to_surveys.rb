class AddHiddenUserIdToSurveys < ActiveRecord::Migration[7.1]
  def change
    add_column :surveys, :hidden_user_id, :integer
  end
end
