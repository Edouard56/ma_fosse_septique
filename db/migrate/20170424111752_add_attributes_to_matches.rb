class AddAttributesToMatches < ActiveRecord::Migration[5.0]
  def change
    add_column :matches, :status, :string
    add_column :matches, :created_at, :datetime
    add_reference :matches, :user, foreign_key: true
    add_reference :matches, :client, foreign_key: true
  end
end
