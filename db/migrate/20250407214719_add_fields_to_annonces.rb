class AddFieldsToAnnonces < ActiveRecord::Migration[8.0]
  def change
    add_column :annonces, :localisation, :string
    add_column :annonces, :date_publication, :date
    add_column :annonces, :image, :string
  end
end
