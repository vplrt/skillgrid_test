class AddFieldsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :pro, :boolean
    add_column :products, :company, :string
    rename_column :products, :user_id, :seller_id
  end
end
