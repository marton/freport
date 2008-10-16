# File: User.rb
# Description: This model holds all persons in fReport, regardless of what role they have.
#              Players, coaches, managers, etc..

class Person < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    first_name  :string, :required
    surname     :string, :required
    address     :string
    postal_code :string
    post_office :string
    phone_home  :string
    phone_cell  :string
    phone_work  :string
    email       :email_address
    timestamps
  end

  belongs_to :user
  #
  def name
    "#{first_name} #{surname}"
  end

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
