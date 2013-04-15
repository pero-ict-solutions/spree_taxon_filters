Spree::Taxon.class_eval do
  def to_filter_params
    "filters[]=#{self.taxonomy_id},#{self.id}"
  end
end