class AddTransactionTypeToAnnonces < ActiveRecord::Migration[8.0]
  def change
    add_column :annonces, :transaction_type, :string
  end
end
