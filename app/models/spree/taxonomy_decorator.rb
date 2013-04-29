Spree::Taxonomy.class_eval do
  attr_accessible :is_a_filter, :filter_ids
  has_and_belongs_to_many :filters, :join_table => "spree_taxonomies_filters", :foreign_key => "filter_id", :class_name => "Spree::Taxonomy"

  def self.filters
    where(:is_a_filter => true)
  end

  def self.without_filters
    where(:is_a_filter => false)
  end

end