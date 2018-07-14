require "test_helper"

describe Zone do
  let(:zone) { Zone.new }

  it "must be valid" do
    value(zone).must_be :valid?
  end
end
