Spree::Product.class_eval do
  def self.filter_by(taxonomy_id, taxon_id)
    joins("INNER JOIN spree_products_taxons AS products_taxons_#{taxonomy_id} ON (spree_products.id = products_taxons_#{taxonomy_id}.product_id) INNER JOIN spree_taxons AS taxons_#{taxonomy_id} ON (taxons_#{taxonomy_id}.id = products_taxons_#{taxonomy_id}.taxon_id)").where("taxons_#{taxonomy_id}.id = ?", taxon_id)
  end
end