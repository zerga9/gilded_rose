require_relative "brie"
require_relative "sulfuras"
require_relative "backstage_passes"
require_relative "normal_item"
require_relative "conjured"
class GildedRose

  def initialize(items)
    @items = items
  end





  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        Aged_brie.new(item)
      when "Sulfuras, Hand of Ragnaros"
        Sulfuras.new(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        Backstage_passes.new(item)
      when "Conjured Mana Cake"
        Conjured.new(item)
      else
        Normal_item.new(item)
      end
      item.sell_in -= 1
    end
  end
end



class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
