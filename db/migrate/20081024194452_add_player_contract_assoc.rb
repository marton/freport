class AddPlayerContractAssoc < ActiveRecord::Migration
  def self.up
    add_column :player_contracts, :person_id, :integer
    add_column :player_contracts, :club_id, :integer
  end

  def self.down
    remove_column :player_contracts, :person_id
    remove_column :player_contracts, :club_id
  end
end
