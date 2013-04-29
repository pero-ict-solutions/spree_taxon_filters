class CreateSpreeTaxonomiesFilters < ActiveRecord::Migration

  def change
    create_table :spree_taxonomies_filters, :id => false do |t|
      t.integer :taxonomy_id
      t.integer :filter_id
    end
  end

end