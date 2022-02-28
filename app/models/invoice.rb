class Invoice < ApplicationRecord
  validates :email,  presence: true, uniqueness: true
end
