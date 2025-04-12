class AddCategoryToAnnonces < ActiveRecord::Migration[8.0]
  def change
    add_column :annonces, :category, :string
  end
end
