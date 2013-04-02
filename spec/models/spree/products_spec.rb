require 'spec_helper'

describe Spree::Product do
  let!(:taxonomy) { create(:taxonomy, name: "Brand") }

  it "response to by_* scope for the taxonomies" do
    Spree::Taxonomy.first.filter_name.should eql :by_brand
    #Spree::Product.by_brand("my brand").should be_empty
    Spree::Product.filter_by(taxonomy, "my brand").should be_empty
  end

  it "returns the products based on the taxon" do
    product = create(:simple_product)
    product.taxons << create(:taxon, name: "my brand", taxonomy: taxonomy)
    Spree::Product.filter_by(taxonomy, "my brand").should include(product)
  end
end