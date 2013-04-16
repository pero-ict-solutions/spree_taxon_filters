Spree::Taxon.class_eval do
  def to_filter_params(params = {})
    filter_param = "filters[]=#{self.taxonomy_id},#{self.id}"
    if params["filters"].present?
      filter_params = []
      filters = params["filters"]
      filters.push("#{self.taxonomy_id},#{self.id}")
      filters.each do |f|
        filter_params.push "filters[]=#{f}"
      end
      filter_param = filter_params.join("&")
    end
    filter_param
  end
end