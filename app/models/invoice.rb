class Invoice < ApplicationRecord
  belongs_to :user
  after_initialize :random_user

  serialize :client_address
  serialize :sender_address

  validates :user, presence: true

  def random_user
    self.user = User.order('RANDOM()').first if self.user.nil?
  end
end
