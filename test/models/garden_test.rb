require "test_helper"

describe Garden do
  let(:garden) { Garden.new }

  it "must be valid" do
    value(garden).must_be :valid?
  end
end
