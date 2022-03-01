class Invoice < ApplicationRecord
  serialize :client_address
  serialize :sender_address

  belongs_to :user
end
