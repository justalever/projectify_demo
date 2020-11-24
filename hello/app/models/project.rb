class Project < ApplicationRecord

  #belongs to a team
  belongs_to :team

  #belongs to a user when created
  belongs_to :user

  #To associate all projects to a team requires us to add a nested form for the team in mention.
  accepts_nested_attributes_for :team

end
