module Spree
  Product.class_eval do

    # Returns a hash of variants mapped to their corresponding option_values.
    def categorise_variants_by_option_values

      variant_hashes = option_types.map do |option_type|
        variants.active.includes(:option_values).group_by { |v| v.option_values.detect { |o| o.option_type_id == option_type.id} }
      end

      # option_values are unique, so flatten the array of hashes into one hash
      variant_hashes.inject(Hash.new){ |new_hash, h| new_hash.merge!(h) }

    end

  end
end