FactoryGirl.define do
  factory :product_with_variants, class: Spree::Product, parent: :product do
    transient do
      option_type_with_values { { :color => %w(Red Green Blue), :size => %w(Small Medium Large) } }
    end

    after(:build) do |product, evaluator|
      option_values_hash = {}

      evaluator.option_type_with_values.each do |name, values|
        ot = create(:option_type, :name => name)
        values.each do |val|
          ot.option_values.create(:name => val.downcase, :presentation => val, :swatch => "#000000")
        end

        option_values_hash[ot.id.to_s] = ot.option_value_ids
      end

      product.option_values_hash = option_values_hash
    end
  end
end
