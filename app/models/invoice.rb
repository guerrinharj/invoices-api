class Invoice < ApplicationRecord
  serialize :client_address
  serialize :sender_address
  validates :email, uniqueness: true

  belongs_to :user
end
