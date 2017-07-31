class RenameContactColumn < ActiveRecord::Migration
  def change
    rename_column :contacts, :contact, :content
  end
end
