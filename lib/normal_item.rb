class Normal_item
  def initialize(item)
    if item.sell_in > 0
      item.quality > 0 && item.quality < 50 ? item.quality -= 1 : item.quality
    else
      item.quality > 0 ? item.quality -= 2 : item.quality
    end
  end
end
