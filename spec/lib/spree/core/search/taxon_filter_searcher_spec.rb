require "spec_helper"

describe Spree::Core::Search::TaxonFilterSearcher do

  context "#retrieve_products" do

    let(:taxonomy_by_brand) { create(:taxonomy, :name => "Brand") }
    let(:taxonomy_by_color) {create(:taxonomy, :name => "Color") }

    let(:sony_taxon) { create(:taxon, :name => "sony", :taxonomy => taxonomy_by_brand) }

    let(:red_taxon) { create(:taxon, :name => "red", :taxonomy => taxonomy_by_color) }
    let(:green_taxon) { create(:taxon, :name => "green", :taxonomy => taxonomy_by_color) }

    let(:product_sony_red) { create(:simple_product, :taxons => [sony_taxon, red_taxon]) }
    let(:product_sony_green) { create(:simple_product, :taxons => [sony_taxon, green_taxon])}

    context "with base taxon search" do
      let(:params) { {:taxon => sony_taxon.id} }
      let(:searcher) {Spree::Core::Search::TaxonFilterSearcher.new(params)}
      it "returns the products in the taxon" do
        searcher.retrieve_products.should == [product_sony_red,product_sony_green]
      end
    end

    context "with taxon filters present" do

      let(:params) { {"filters" => ["#{taxonomy_by_color.id}, #{red_taxon.id}"]} }
      let(:searcher) {Spree::Core::Search::TaxonFilterSearcher.new(params)}

      it "returns products based on the filters params" do
        searcher.retrieve_products.should include(product_sony_red)
      end

      it "will exclude the products that do not match" do
        searcher.retrieve_products.should_not include(product_sony_green)
      end

    end

  end

end

