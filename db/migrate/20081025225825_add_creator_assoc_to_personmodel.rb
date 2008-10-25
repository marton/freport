class AddCreatorAssocToPersonmodel < ActiveRecord::Migration
  def self.up
    add_column :people, :creator_id, :integer
  end

  def self.down
    remove_column :people, :creator_id
  end
end
