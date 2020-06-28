class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable
  has_many :rooms, class_name: "Room", foreign_key: "owner_id"
  has_many :messages
  validates :email,:password, presence: true
end
