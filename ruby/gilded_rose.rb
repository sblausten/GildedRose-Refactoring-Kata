require './item'

class GildedRose

  attr_reader :items

  def initialize(items)
    @items = items
  end

  def update_items()
    @items.each do |item|
      update_quality(item)
      update_sell_in(item)
    end
  end

  private

  MAX_QUALITY = 50
  MIN_QUALITY = 0

  def update_quality(item)
    item.quality -= 1 unless check_backstage_pass(item) ||
      check_aged_brie(item) ||
      check_conjured(item) ||
      check_sulfuras(item) ||
      check_out_of_date(item)
    enforce_quality_limits(item)
  end

  def check_backstage_pass(item)
    if item.name.start_with?("Backstage passes")
      if item.sell_in <= 0
        item.quality = 0
      elsif item.sell_in <= 5
        item.quality += 3
      elsif item.sell_in <= 10
        item.quality += 2
      else
        item.quality += 1
      end
    end
  end

  def check_sulfuras(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def check_aged_brie(item)
    item.quality += 1 if item.name == "Aged Brie"
  end

  def check_conjured(item)
    item.quality -= 2 if item.name.start_with?("Conjured")
  end

  def check_out_of_date(item)
    item.quality -= 2 if item.sell_in <= 0
  end

  def enforce_quality_limits(item)
    item.quality = MAX_QUALITY if item.quality > MAX_QUALITY
    item.quality = MIN_QUALITY if item.quality < MIN_QUALITY
  end

  def update_sell_in(item)
    item.sell_in -= 1 unless item.name == "Sulfuras, Hand of Ragnaros"
  end
end
