class CreateAnnonces < ActiveRecord::Migration[8.0]
  def change
    create_table :annonces do |t|
      t.references :utilisateur, null: false, foreign_key: true
      t.string :titre
      t.text :description
      t.float :prix
      t.string :categorie
      t.string :statut
      t.binary :media
      t.datetime :date

      t.timestamps
    end
  end
end
