require "spec_helper"

describe Spree::Taxonomy do

  it "create filter name by name" do
    Spree::Taxonomy.create(:name => "my test").filter_name.should eql :by_my_test
  end

  it "singularize by the name" do
    Spree::Taxonomy.create(:name => "categories").filter_name.should eql :by_category
  end

end