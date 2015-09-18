class AddCompanyToSellers < ActiveRecord::Migration
  def change
    add_column :sellers, :company, :string
  end
end
