require "spec_helper"

describe Spree::Taxonomy do
  it "filter_name" do
    Spree::Taxonomy.create(name: "my test").filter_name.should eql :by_my_test
  end
end