require 'spec_helper'

describe Spree::Product do
  let!(:taxonomy) { create(:taxonomy, :name => "Brand") }

  context "#filter_by" do
    it "returns empty result when no taxon assigned" do
      Spree::Product.filter_by(1).should be_empty
    end

    context "when taxons are assigned to product" do
      let(:taxonomy_by_color) {create(:taxonomy, :name => "Color") }
      let(:red_taxon) { create(:taxon, :name => "red", :taxonomy => taxonomy_by_color) }
      let(:green_taxon) { create(:taxon, :name => "green", :taxonomy => taxonomy_by_color) }
      let(:sony_taxon) { create(:taxon, :name => "sony", :taxonomy => taxonomy) }

      let(:product_red) { create(:simple_product, :taxons => [sony_taxon, red_taxon]) }
      let(:product_green) { create(:simple_product, :taxons => [sony_taxon, green_taxon])}

      it "returns the products that are assigned that taxon" do
        Spree::Product.filter_by(sony_taxon.id).should include(product_red, product_green)
      end

      context "and when chaining filter_by" do
        it "include the products that match the extra filter" do
          Spree::Product.filter_by(sony_taxon.id).filter_by(red_taxon.id).should include(product_red)
        end

        it "excludes the products that does not match the extra filter" do
          Spree::Product.filter_by(sony_taxon.id).filter_by(red_taxon.id).should_not include(product_green)
        end
      end
    end
  end
end