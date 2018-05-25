
class Conjured
  def initialize(item)
    if item.quality > 1 && item.quality <=50
      item.quality -= 2
    elsif item.quality <= 0
      item.quality = 0
    end
  end
end
