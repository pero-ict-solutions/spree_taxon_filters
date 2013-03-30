# Needed in this order

Spree::Taxonomy.class_eval do
  def filter_name
    n = self.name.singularize.underscore.gsub(' ','_')
    "by_#{n}".to_sym
  end
end

Spree::Product.class_eval do
  Spree::Taxonomy.all.each do |t|
    scope t.filter_name, lambda { |name|
      joins("INNER JOIN spree_products_taxons AS products_taxons_#{t.filter_name} ON (spree_products.id = products_taxons_#{t.filter_name}.product_id) INNER JOIN spree_taxons AS taxons_#{t.filter_name} ON (taxons_#{t.filter_name}.id = products_taxons_#{t.filter_name}.taxon_id)").where("taxons_#{t.filter_name}.name = ?", name)
    }
  end
end