class AddPicturesToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.attachment :avatar
      t.attachment :passport
    end
  end

  def self.down
    remove_attachment :admins, :avatar
    remove_attachment :admins, :passport
  end
end
