class AddCatProductToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :cat_product, :string
  end
end
