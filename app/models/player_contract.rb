class PlayerContract < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    active           :boolean
    start_date       :datetime
    termination_date :datetime
    contract_note    :text
    timestamps
  end

  belongs_to :person
  belongs_to :club

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
