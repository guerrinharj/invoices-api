require 'rails_helper'

RSpec.describe Invoice, type: :model do
  it "should have an user" do
    expect(subject).not_to be_nil
  end
end
