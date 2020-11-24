class Team < ApplicationRecord

  #projects within a team to be destroyed if a team is destroyed
  has_many :projects, dependent: :destroy

  has_many :users

  #To invite people, we need nested forms
  accepts_nested_attributes_for :users, allow_destroy: true
end
