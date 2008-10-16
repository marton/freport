class AddPersonModel < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string   :name
      t.string   :surname
      t.string   :address
      t.string   :postal_code
      t.string   :post_office
      t.string   :phone_home
      t.string   :phone_cell
      t.string   :phone_work
      t.string   :email
      t.datetime :created_at
      t.datetime :updated_at
      t.integer  :user_id
    end
  end

  def self.down
    drop_table :people
  end
end
