module Spree::Core::Search
  class TaxonFilterSearcher < Base

    def initialize(params)
      super
      @properties[:taxon_filters] = params["filters"] ||= []
    end

    def get_base_scope
      base_scope = super
      @properties[:taxon_filters].each do |taxon_filter|
        taxonomy_id, taxon_id = taxon_filter.split(",")
        base_scope = base_scope.filter_by(taxonomy_id, taxon_id)
      end
      base_scope
    end
  end
end