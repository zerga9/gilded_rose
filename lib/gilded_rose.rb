require_relative "brie"
class GildedRose

  def initialize(items)
    @items = items
  end

  def normal(item)
    if item.sell_in > 0
      item.quality > 0 && item.quality < 50 ? item.quality -= 1 : item.quality
    else
      item.quality > 0 ? item.quality -= 2 : item.quality
    end
  end

 def sulfuras(item)
   item.quality = item.quality
 end

 def backstage_passes(item)
   if item.sell_in <= 0
     item.quality = 0
   else
     if item.sell_in < 6
        item.quality += 3
     elsif item.sell_in < 11 && item.sell_in > 5
        item.quality += 2
      else
        item.quality += 1
     end
     item.quality > 50 ? item.quality = 50 : item.quality
   end
 end


  def conjured(item)
    if item.quality > 1 && item.quality <=50
      item.quality -= 2
    elsif item.quality <= 0
      item.quality = 0
    end
  end




  def update_quality()
    @items.each do |item|
      case item.name
      when "Aged Brie"
        Aged_brie.new(item)
      when "Sulfuras, Hand of Ragnaros"
        sulfuras(item)
      when "Backstage passes to a TAFKAL80ETC concert"
        backstage_passes(item)
      when "Conjured Mana Cake"
        conjured(item)
      else
        normal(item)
      end
      item.sell_in -= 1
    end
  end
end



  #   @items.each do |item|
  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0
  #         if item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #         end
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 11
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #           if item.sell_in < 6
  #             if item.quality < 50
  #               item.quality = item.quality + 1
  #             end
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #       if item.name != "Aged Brie"
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0
  #             if item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #             end
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       else
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       end
  #     end
  #   end
  # end
# end

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
