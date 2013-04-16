require 'spec_helper'

describe Spree::Taxon do
  let(:taxon) { create(:taxon)}

  context "#to_filter_params" do
    it "returns the filters[] params for filtering" do
      taxon.to_filter_params.should == "filters[]=#{taxon.taxonomy.id},#{taxon.id}"
    end
  end

end