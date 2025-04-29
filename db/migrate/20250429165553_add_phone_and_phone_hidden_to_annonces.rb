class AddPhoneAndPhoneHiddenToAnnonces < ActiveRecord::Migration[8.0]
  def change
    add_column :annonces, :phone, :string
    add_column :annonces, :phone_hidden, :boolean
  end
end
