class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :confirmable, :invitable, invite_for: 2.weeks

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
