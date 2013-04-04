require "spec_helper"

describe Spree::Taxonomy do

  context "#filter_name" do
    it "returns the name as symbol and underscored" do
      Spree::Taxonomy.create(:name => "my test").filter_name.should eql :by_my_test
    end

    it "returns singular name" do
      Spree::Taxonomy.create(:name => "categories").filter_name.should eql :by_category
    end
  end

end