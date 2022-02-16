class GroupSpending < ApplicationRecord
  validates :group_id, presence: true
  validates :spending_id, presence: true

  belongs_to :group
  belongs_to :spending
end
