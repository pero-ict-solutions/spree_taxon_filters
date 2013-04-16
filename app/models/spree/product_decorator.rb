Spree::Product.class_eval do
  def self.filter_by(taxon_id)
    joins("INNER JOIN spree_products_taxons AS products_taxons_#{taxon_id} ON (spree_products.id = products_taxons_#{taxon_id}.product_id) INNER JOIN spree_taxons AS taxons_#{taxon_id} ON (taxons_#{taxon_id}.id = products_taxons_#{taxon_id}.taxon_id)").where("taxons_#{taxon_id}.id = ?", taxon_id)
  end
end