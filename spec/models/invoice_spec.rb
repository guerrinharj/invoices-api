require 'rails_helper'

RSpec.describe Invoice, type: :model do
  before { described_class.create!(email: 'john@home.xyz') }
  it 'is invalid if the email is not unique' do
  expect(subject).to be_invalid
  end
end
