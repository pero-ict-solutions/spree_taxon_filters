Spree::Taxonomy.class_eval do

  def self.filters
    where(:is_a_filter => true)
  end

  def self.without_filters
    where(:is_a_filter => false)
  end

end