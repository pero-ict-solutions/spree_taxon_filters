module Spree::Core::Search
  class TaxonFilterSearcher < Base

    def initialize(params)
      super
      @properties[:taxon_filters] = params["filters"] ||= []
    end

    def get_base_scope
      base_scope = super
      @properties[:taxon_filters].each do |taxon_filter|
        base_scope = base_scope.filter_by(taxon_filter)
      end
      base_scope
    end
  end
end