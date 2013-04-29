class AddIsAFilterToSpreeTaxonomies < ActiveRecord::Migration
  def change
    add_column :spree_taxonomies, :is_a_filter, :boolean
  end
end
