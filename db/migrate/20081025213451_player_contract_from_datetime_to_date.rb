class PlayerContractFromDatetimeToDate < ActiveRecord::Migration
  def self.up
    change_column :player_contracts, :start_date, :date
    change_column :player_contracts, :termination_date, :date
  end

  def self.down
    change_column :player_contracts, :start_date, :datetime
    change_column :player_contracts, :termination_date, :datetime
  end
end
