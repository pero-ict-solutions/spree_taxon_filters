require 'spec_helper'

describe Spree::Taxon do
  let(:taxon) { create(:taxon) }

  context "#to_filter_params" do
    it "returns the filters[] params for filtering" do
      taxon.to_filter_params.should == "filters[]=#{taxon.taxonomy.id},#{taxon.id}"
    end
  end

  context "with another filter already in params" do

    let(:other_taxon) { create(:taxon) }
    let(:yet_other_taxon) { create(:taxon) }

    context "when 1 filter present" do
      let(:params) { {"filters" => ["#{other_taxon.taxonomy.id},#{other_taxon.id}"]}}
      context "#to_filter_params" do
        it "will append the taxon as a filter" do
          taxon.to_filter_params(params).should == "filters[]=#{other_taxon.taxonomy.id},#{other_taxon.id}&filters[]=#{taxon.taxonomy.id},#{taxon.id}"
        end
      end
    end

    context "when more then 1 filters present" do
      let(:params) { {"filters" => ["#{other_taxon.taxonomy.id},#{other_taxon.id}","#{yet_other_taxon.taxonomy.id},#{yet_other_taxon.id}"]}}
      context "#to_filter_params" do
        it "will append the taxon as a filter" do
          taxon.to_filter_params(params).should == "filters[]=#{other_taxon.taxonomy.id},#{other_taxon.id}&filters[]=#{yet_other_taxon.taxonomy.id},#{yet_other_taxon.id}&filters[]=#{taxon.taxonomy.id},#{taxon.id}"
        end
      end
    end
  end
end