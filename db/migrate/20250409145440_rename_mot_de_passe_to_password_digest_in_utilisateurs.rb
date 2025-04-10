class RenameMotDePasseToPasswordDigestInUtilisateurs < ActiveRecord::Migration[7.0]
  def change
    rename_column :utilisateurs, :mot_de_passe, :password_digest
  end
end
