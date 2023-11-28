class AddPhotosToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :photos, :string
  end
end
