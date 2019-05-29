class Product < ApplicationRecord

    def slug
        name.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        Product.all.find{|product| product.slug == slug}
    end

end
