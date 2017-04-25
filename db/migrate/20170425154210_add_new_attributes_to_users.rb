class AddNewAttributesToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :description, :text
    add_column :users, :radius, :integer
  end
end
