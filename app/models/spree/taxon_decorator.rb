Spree::Taxon.class_eval do
  def to_filter_params(params = {})
    taxon_filter = "#{self.taxonomy_id},#{self.id}"
    filter_param = "filters[]=#{taxon_filter}"
    if params["filters"].present?
      filter_params = []
      filters = params["filters"]
      if filters.include?(taxon_filter)
        filters.delete(taxon_filter)
      else
        filters.push("#{self.taxonomy_id},#{self.id}")
      end
      filters.each do |f|
        filter_params.push "filters[]=#{f}"
      end
      filter_param = filter_params.join("&")
    end
    filter_param
  end
end