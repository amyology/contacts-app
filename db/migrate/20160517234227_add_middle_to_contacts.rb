class AddMiddleToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :middle, :string
  end
end
