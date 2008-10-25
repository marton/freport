# File: User.rb
# Description: This model holds all persons in fReport, regardless of what role they have.
#              Players, coaches, managers, etc..

class Person < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    first_name  :string
    surname     :string
    address     :string
    postal_code :string
    post_office :string
    phone_home  :string
    phone_cell  :string
    phone_work  :string
    email       :email_address
    timestamps
  end

  belongs_to :creator, :class_name => "User", :creator => true
  belongs_to :user
  has_many :player_contracts, :dependent => :destroy
  has_many :clubs, :through =>  :player_contracts
  has_many :team_roles
  
  # Enourmous amount of validations.. Adding people will suck :-)
  validates_length_of :first_name, :within => 2..50
  validates_length_of :surname, :within => 2..50
  validates_length_of :address, :within => 2..150, :allow_blank => true
  validates_length_of :postal_code, :within => 2..50, :allow_blank => true
  validates_length_of :post_office, :within => 2..50, :allow_blank => true
  validates_length_of :phone_home, :within => 7..50, :allow_blank => true
  validates_length_of :phone_cell, :within => 7..50, :allow_blank => true
  validates_length_of :phone_work, :within => 7..50, :allow_blank => true
  
  # Custom validations to ensure that post office and postal code go hand in hand (can not have one without the other) and
  # that all persons have atleast one phonenumber
  def validate
    errors.add(:post_office, "- must be filled for postalcode #{self.postal_code}") if self.post_office.blank? && !self.postal_code.blank?
    errors.add(:postal_code, "- must be filled for #{self.post_office}") if self.postal_code.blank? && !self.post_office.blank?    
    errors.add_to_base("- Person must have at least one phonenumber") if (self.phone_home.blank? && self.phone_cell.blank? && self.phone_work.blank?)    
  end
    
  def name
    "#{first_name} #{surname}"
  end

  # TODO: Add persmissions for Persons
  
  # --- Hobo Permissions --- #

  def creatable_by?(user)
    user.administrator?
  end

  def updatable_by?(user, new)
    user.administrator?
  end

  def deletable_by?(user)
    user.administrator?
  end

  def viewable_by?(user, field)
    true
  end

end
