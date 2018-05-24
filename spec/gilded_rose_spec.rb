require 'gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end
    it "the quality of an item is never negative" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0

    end
    it "'Aged Brie' increases in quality the older it gets" do
      items = [Item.new('Aged Brie', 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to be > 0
    end
  end

end
