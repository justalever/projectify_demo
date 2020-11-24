class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :teams


  def active_for_authentication?
    super && self.is_active?
  end


  def inactive_message
    is_active? ? super : :account_banned
  end


end
