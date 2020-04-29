class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :database_authenticatable, :confirmable, :invitable, invite_for: 2.weeks

  has_many :users_projects
  has_many :projects, through: :users_projects
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
