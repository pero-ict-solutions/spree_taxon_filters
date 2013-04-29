class FixFiltersOnTaxons < ActiveRecord::Migration
  def change
    rename_column :spree_taxonomies_filters, :taxonomy_id, :taxon_id
    rename_column :spree_taxonomies_filters, :filter_id, :taxonomy_id
  end
end
