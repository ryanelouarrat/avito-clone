class CreateUtilisateurs < ActiveRecord::Migration[8.0]
  def change
    create_table :utilisateurs do |t|
      t.string :nom
      t.string :email
      t.string :ville
      t.string :telephone
      t.string :mot_de_passe

      t.timestamps
    end
  end
end
