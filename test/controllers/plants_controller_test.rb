require "test_helper"

describe PlantsController do
  it "should get index" do
    get plants_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get plants_show_url
    value(response).must_be :success?
  end

end
