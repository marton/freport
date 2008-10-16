class ChangeNameToFirstname < ActiveRecord::Migration
  def self.up
    rename_column :people, :name, :first_name
  end

  def self.down
    rename_column :people, :first_name, :name
  end
end
