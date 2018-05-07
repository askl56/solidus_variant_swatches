module Spree
  OptionValue.class_eval do
    Spree::PermittedAttributes.variant_attributes.concat [:swatch]

    validates :swatch, format: { :with => /\A(#([0-9a-f]{3}|[0-9a-f]{6})|http(s)?:\/\/.+)\z/i }, allow_nil: true, allow_blank: true

    def has_swatch?
      swatch && !swatch.blank?
    end

  end
end
