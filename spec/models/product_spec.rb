RSpec.describe Spree::Product, type: :model do

  context "with option variants" do

    let(:product) do
      build(:product_with_variants)
    end

    it "has valid factories" do
      product.save!
      expect(product.variants.length).to eql(9)
    end

    describe "categorise_variants_by_option_values" do
      it "should retrieve all option values" do
        product.save!

        value_hash = product.categorise_variants_by_option_values
        expect(value_hash.keys.map{ |k| k.presentation }).to match_array(%w(Red Green Blue Small Medium Large))
      end

      it "variants should be mapped under their option values" do
        product.save!

        value_hash = product.categorise_variants_by_option_values
        value_hash.each do |option_value, variants|
          expect(variants).to all( satisfy { |v| v.option_values.map{ |ov| ov.id }.include? option_value.id } )
        end
      end
    end
  end

end
