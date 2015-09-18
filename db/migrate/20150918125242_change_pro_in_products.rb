class ChangeProInProducts < ActiveRecord::Migration
  def change
    change_column :products, :pro, :boolean, null: false, default: false
  end
end
