class AddBiographyToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :biography, :text
  end
end
