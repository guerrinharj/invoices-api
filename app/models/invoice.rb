require 'faker'

class Invoice < ApplicationRecord
  belongs_to :user
  after_initialize :random_user
  after_initiliaze :generate_code

  serialize :client_address
  serialize :sender_address

  validates :user, presence: true

  def random_user
    self.user = User.order('RANDOM()').first if self.user.nil?
  end

  def generate_code
    self.code = Faker::Code.nric if self.code.nil?
  end
end
