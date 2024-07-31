class Invoice < ApplicationRecord
  # Associations
  has_many :quotations, dependent: :destroy
  # Validations
  validates :due_date, presence: true, comparison: { greater_than: proc { Date.today }}
  # Callbacks
end
