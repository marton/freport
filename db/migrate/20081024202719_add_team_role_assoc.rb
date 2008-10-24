class AddTeamRoleAssoc < ActiveRecord::Migration
  def self.up
    add_column :team_roles, :person_id, :integer
  end

  def self.down
    remove_column :team_roles, :person_id
  end
end
