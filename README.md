SpreeTaxonFilters
=================
[![Build Status](https://travis-ci.org/pero-ict-solutions/spree_taxon_filters.png?branch=master)](https://travis-ci.org/pero-ict-solutions/spree_taxon_filters)

Filter your products based on the taxonomies.

This extension will add a scope to your product for each taxonomy. That scope accepts a taxon value from the taxonomy and will return all products that are assigned that taxon. 

So with the Taxonomies "Brands" and "Categories" you could filter the products like this:

Spree::Product.by_brand("nike").by_category("shoes")

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2013 Peter Berkenbosch, released under the New BSD License
