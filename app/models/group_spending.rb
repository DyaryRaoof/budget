class GroupSpending < ApplicationRecord
  belongs_to :group
  belongs_to :spending
end
