class Spending < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :name, presence: true
  validates :amount, presence: true, numericality: {greater_than_or_equal_to: 0}
  
  has_many :group_spendings, dependent: :destroy
end
