class PlayerContract < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    active           :boolean
    start_date       :date
    termination_date :date
    contract_note    :text
    timestamps
  end

  belongs_to :person
  belongs_to :club
  
  # Some custom validations to ensure that a Player never have more than one active contract at a time and that the players 
  # contract has valid start-end date.
  def validate
    errors.add(:active, "- A player can only have one active contract") unless PlayerContract.find(:all, :conditions => {:person_id => self.person_id, :active => true}).blank? if self.active
    errors.add(:start_date, "must be earlier than termination date") if self.start_date > self.termination_date
  end

  # TODO: Add permissions to Playercontract
  
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
