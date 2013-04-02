Spree::Product.class_eval do
  def self.filter_by(taxonomy, name)
    joins("INNER JOIN spree_products_taxons AS products_taxons_#{taxonomy.filter_name} ON (spree_products.id = products_taxons_#{taxonomy.filter_name}.product_id) INNER JOIN spree_taxons AS taxons_#{taxonomy.filter_name} ON (taxons_#{taxonomy.filter_name}.id = products_taxons_#{taxonomy.filter_name}.taxon_id)").where("taxons_#{taxonomy.filter_name}.name = ?", name)
  end
end