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

end