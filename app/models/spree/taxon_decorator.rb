Spree::Taxon.class_eval do

  has_and_belongs_to_many :filters, :join_table => "spree_taxonomies_filters", :class_name => "Spree::Taxonomy"

  def taxon_filter
    self.id.to_s
  end

  def to_filter_params(params = {})
    filter_params = params["filters"].try(:dup) || []
    if(filter_params.include?(taxon_filter))
      filter_params.delete(taxon_filter)
    else
      filter_params << (taxon_filter)
    end
    filter_params.map {|f| "filters[]=#{f}"}.join("&")
  end
end

Spree::PermittedAttributes.taxon_attributes.push( filter_ids: [] )