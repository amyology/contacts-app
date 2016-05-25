class AddUsertoContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :user_id, :integer, default: 1
  end
end
