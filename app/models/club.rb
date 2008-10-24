class Club < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    name    :string
    founded :datetime
    timestamps
  end

  has_many :players, :through => :player_pontracts, :source => 'person'
  has_many :player_contracts, :dependent => :destroy

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
