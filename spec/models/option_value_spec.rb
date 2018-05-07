RSpec.describe Spree::OptionValue, type: :model do
  describe "swatch" do
    it "can be nil or blank" do
      option_value = build(:option_value)
      expect(option_value.valid?).to eql(true)

      option_value.swatch = ''
      expect(option_value.valid?).to eql(true)
    end

    it "allows valid hex color values" do
      option_value = build(:option_value)

      valid_colors = [
        '#000',
        '#fff',
        '#ff0000',
        '#ffffff',
        '#bada55',
        '#c0ffee'
      ]

      valid_colors.each do |color|
        option_value.swatch = color
        expect(option_value.valid?).to eql(true)
      end
    end

    it "does not allow invalid hex color values" do
      option_value = build(:option_value)
      invalid_colors = [
        # too short
        '#00',
        # too long
        '#fffffff',
        # hex number out of range
        '#g00000',
        'purple',
        # missing hash
        '000000'
      ]

      invalid_colors.each do |color|
        option_value.swatch = color
        expect(option_value.valid?).to eql(false)
      end
    end

    it "allows valid URLs" do
      option_value = build(:option_value)

      valid_urls = [
        'http://i713.photobucket.com/albums/ww131/brent_02/red-plaid-bg.jpg',
        'https://ateachingmoment.files.wordpress.com/2011/03/plaid2.jpg'
      ]

      valid_urls.each do |color|
        option_value.swatch = color
        expect(option_value.valid?).to eql(true)
      end
    end

    it "does not allow invalid URLs" do
      option_value = build(:option_value)

      invalid_urls = [
        'i713.photobucket.com/albums/ww131/brent_02/red-plaid-bg.jpg',
        'plaid.jpg',
        'www.plaid.com/plaid.jpg'
      ]

      invalid_urls.each do |color|
        option_value.swatch = color
        expect(option_value.valid?).to eql(false)
      end
    end

    describe "has_swatch?" do
      it "is falsey if no swatch value" do
        option_value = build(:option_value)
        option_value.swatch = nil
        expect(option_value.has_swatch?).to be_falsey
      end

      it "is falsey if swatch value is blank" do
        option_value = build(:option_value)
        option_value.swatch = ''
        expect(option_value.has_swatch?).to be_falsey
      end

      it "is truthy if swatch value is non blank" do
        option_value = build(:option_value)
        option_value.swatch = '#000000'
        expect(option_value.has_swatch?).to be_truthy
      end
    end
  end
end
