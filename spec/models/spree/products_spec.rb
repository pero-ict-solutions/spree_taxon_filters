require 'spec_helper'

describe Spree::Product do
  let!(:taxonomy) { create(:taxonomy, name: "Brand") }

  it "response to by_* scope for the taxonomies" do
    Spree::Taxonomy.first.filter_name.should eql :by_brand
    Spree::Product.filter_by(taxonomy, "my brand").should be_empty
  end

  it "returns the products based on the taxon" do
    product = create(:simple_product)
    product.taxons << create(:taxon, name: "my brand", taxonomy: taxonomy)
    Spree::Product.filter_by(taxonomy, "my brand").should include(product)
  end

  context "chained filters" do

    it "filters all the products based on the chain" do
      color_taxonomy = create(:taxonomy, name: "Color")
      red_taxon = create(:taxon, name: "red", taxonomy: color_taxonomy)
      green_taxon = create(:taxon, name: "green", taxonomy: color_taxonomy)

      product_red = create(:simple_product)
      product_green = create(:simple_product)

      sony_taxon = create(:taxon, name: "sony", taxonomy: taxonomy)

      product_red.taxons << red_taxon
      product_red.taxons << sony_taxon

      product_green.taxons << green_taxon
      product_green.taxons << sony_taxon

      product_red.save
      product_green.save

      Spree::Product.filter_by(taxonomy, "sony").should include(product_red, product_green)
      Spree::Product.filter_by(taxonomy, "sony").filter_by(color_taxonomy,"red").should include(product_red)
      Spree::Product.filter_by(taxonomy, "sony").filter_by(color_taxonomy,"red").should_not include(product_green)
    end

  end

end