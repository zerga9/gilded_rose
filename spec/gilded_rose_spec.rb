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

    it 'quality Backstage passes increases by 2 when between 10 and 5 days' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 9, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 12
    end

    it 'quality Backstage passes increases by 3 when between 5 and 0 days' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 13
    end

    it 'quality Backstage passes drops to 0 when 0 days left' do
      items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end


    it 'Sulfuras never decreases in quality' do
      items = [Item.new("Sulfuras, Hand of Ragnaros", 1, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 40
    end
    it 'once sell by date passed, quality degrades twice as fast' do
      items = [Item.new("foo",0,6)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 4
    end
    it 'conjured items degrade twice as fast in quality as normal items' do
      items = [Item.new("Conjured Mana Cake", 1, 40)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 38
    end

  end

end
