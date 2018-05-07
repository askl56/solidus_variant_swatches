RSpec.describe Spree::ProductsHelper, type: :helper do

  let(:product) do
    build(:product)
  end

  let(:product_with_variants) do
    create(:product_with_variants)
  end

  describe "swatches_for" do
    before do
      allow(helper).to receive(:product_path) { "/products/0" }
    end

    it "is blank if no variants" do
      expect(helper.swatches_for(product).empty?).to eq(true)
    end

    it "is not blank if variants" do
      expect(product_with_variants.variants.length).to eq(9)

      expect(helper.swatches_for(product_with_variants).empty?).to eq(false)
    end
  end

  describe "swatch_style" do
    it "returns nothing if swatch is nil" do
      option_value = build(:option_value)
      option_value.swatch = nil

      expect(helper.swatch_style(option_value)).to eq(nil)
    end

    it "sets background color if swatch is a color value" do
      option_value = build(:option_value)
      option_value.swatch = "#ff0000"

      expect(helper.swatch_style(option_value)).to include("background-color")
    end

    it "sets background image if swatch is a URL value" do
      option_value = build(:option_value)
      option_value.swatch = "http://api.adorable.io/avatars/50/swatch.png"

      expect(helper.swatch_style(option_value)).to include("background-image")
    end
  end

end
