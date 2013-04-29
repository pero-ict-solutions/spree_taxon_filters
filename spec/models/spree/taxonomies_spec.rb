require 'spec_helper'

describe Spree::Taxonomy do
  let!(:taxonomy) { create(:taxonomy) }
  let!(:taxonomy_as_filter) { create(:taxonomy, :is_a_filter => true) }

  context "::filters" do
    it "will return the taxonomies thare are a filter" do
      Spree::Taxonomy.filters.should include(taxonomy_as_filter)
    end

    it "will not return the other taxonomies" do
      Spree::Taxonomy.filters.should_not include(taxonomy)
    end
  end

  context "::without_filters" do
    it "will return the taxonomies thare are not a filter" do
      Spree::Taxonomy.without_filters.should include(taxonomy)
    end

    it "will not return the filter taxonomies" do
      Spree::Taxonomy.without_filters.should_not include(taxonomy_as_filter)
    end
  end

end