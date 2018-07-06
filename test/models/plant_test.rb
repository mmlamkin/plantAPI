require "test_helper"

describe Plant do
  let(:plant) { Plant.new }

  it "must be valid" do
    value(plant).must_be :valid?
  end
end
