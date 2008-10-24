class PlayerContractsController < ApplicationController

  hobo_model_controller

  auto_actions :all, :except => :index
  
  auto_actions_for :person, [ :new, :create ]
  auto_actions_for :club, [ :new, :create ]
  
end
