require 'spec_helper'

describe "Admin Taxonomies as filters" do

  stub_authorization!
  let(:taxonomy) {create(:taxonomy)}

  it "can mark a taxonomy as filter" do
    visit spree.edit_admin_taxonomy_path(taxonomy)
    check "Is a filter"
    click_button "Update"
    page.should have_content("successfully")
  end

  context "assign filters to taxonomies" do
    let!(:taxonomy_filter) {create(:taxonomy, :is_a_filter => true)}

    it "can assign taxonomy filters to taxonomy" do
      visit spree.edit_admin_taxonomy_path(taxonomy)
      check "taxonomy_filter_#{taxonomy_filter.id}"
      click_button "Update"
      page.should have_content("successfully")
      taxonomy.filters.should include(taxonomy_filter)
    end

    it "will not list the filter taxonomies on a filter taxonomy" do
      visit spree.edit_admin_taxonomy_path(taxonomy_filter)
      page.should_not have_content "Filters"
    end

  end


end