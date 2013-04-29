class AddDefaultToIsAFilterToSpreeTaxonomies < ActiveRecord::Migration
  def change
    change_column :spree_taxonomies, :is_a_filter, :boolean, :default => false
  end
end
