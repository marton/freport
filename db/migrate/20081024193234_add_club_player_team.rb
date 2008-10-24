class AddClubPlayerTeam < ActiveRecord::Migration
  def self.up
    create_table :clubs do |t|
      t.string   :name
      t.datetime :founded
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :club_roles do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :player_contracts do |t|
      t.boolean  :active
      t.datetime :start_date
      t.datetime :termination_date
      t.text     :contract_note
      t.datetime :created_at
      t.datetime :updated_at
    end
    
    create_table :team_roles do |t|
      t.datetime :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :clubs
    drop_table :club_roles
    drop_table :player_contracts
    drop_table :team_roles
  end
end
