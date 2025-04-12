class AddTypeToAnnonce < ActiveRecord::Migration[8.0]
  def change
    add_column :annonces, :type, :string
  end
end
