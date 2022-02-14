class Group < ApplicationRecord
    validates :name, presence: true
    validates :icon, presence: true
    validates :name, uniqueness: true
    
    has_many :group_spendings, dependent: :destroy
end
