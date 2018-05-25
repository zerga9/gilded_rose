class Aged_brie
  def initialize(item)
    item.quality < 50 ? item.quality += 1 : item.quality
  end
end
