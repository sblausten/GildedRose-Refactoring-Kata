class GildedRose
  MAX_QUALITY = 50
  MIN_QUALITY = 0
  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_items()
    @items.each do |item|
      quality(item)
      sell_in(item)
    end
  end

  private

  def quality(item)
    if item.name == "Aged Brie"
      item.quality += 1
    elsif item.name.start_with?("Backstage passes")
      if item.sell_in <= 0
        item.quality = 0
      elsif item.sell_in <= 5
        item.quality += 3
      elsif item.sell_in <= 10
        item.quality += 2
      else
        item.quality += 1
      end
    elsif item.name.start_with?("Conjured")
      item.quality -= 2
    elsif item.name == "Sulfuras, Hand of Ragnaros"
    elsif item.sell_in <= 0
      item.quality -= 2
    else
      item.quality -= 1
    end
    item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
    item.quality = MIN_QUALITY if item.quality < MIN_QUALITY
  end

  def sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
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
