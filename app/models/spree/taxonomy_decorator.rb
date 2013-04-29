Spree::Taxonomy.class_eval do
  attr_accessible :is_a_filter

  def self.filters
    where(:is_a_filter => true)
  end

  def self.without_filters
    where(:is_a_filter => false)
  end

end