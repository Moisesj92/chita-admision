class Invoice < ApplicationRecord
  # Associations
    has_many :quotations, dependent: :destroy
  # Validations
  # Callbacks
end
