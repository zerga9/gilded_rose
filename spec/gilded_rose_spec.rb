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
    it 'quality "Aged Brie" never more than 50' do
      items = [Item.new("Aged Brie", 1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end
    it 'quality "Backstage passes" never more than 50' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 1, 50)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 50
    end

    it 'Sulfuras never decreases in quality' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 40
    end
  end

end
