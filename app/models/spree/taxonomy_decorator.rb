Spree::Taxonomy.class_eval do
  def filter_name
    n = self.name.singularize.underscore.gsub(' ','_')
    "by_#{n}".to_sym
  end
end


