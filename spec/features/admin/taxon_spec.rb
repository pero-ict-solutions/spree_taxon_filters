require 'spec_helper'

describe "Admin::Taxon" do
  stub_authorization!
  let!(:taxon) { create(:taxon) }

  context "assign filters to taxon" do
    let!(:taxonomy_filter) {create(:taxonomy, :is_a_filter => true)}

    it "can assign taxonomy filters to taxon" do
      visit spree.edit_admin_taxonomy_taxon_path(taxon.taxonomy, taxon.id)
      check "taxon_filter_#{taxonomy_filter.id}"
      click_button "Update"
      page.should have_content("successfully")
      taxon.filters.should include(taxonomy_filter)
    end

  end
end