class Backstage_passes
  def initialize(item)
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
end
