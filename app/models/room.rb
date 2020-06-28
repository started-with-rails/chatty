class Room < ApplicationRecord
    has_many :messages, dependent: :destroy
    has_many :users, -> { distinct }, through: :messages
    belongs_to :user, class_name: "User", foreign_key: "owner_id"
    validates :name, presence: true
    validates_uniqueness_of :name, scope: :owner_id
end
