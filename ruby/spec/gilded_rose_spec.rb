require './gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    context 'for standard items' do
      before(:each) do
        @items = [Item.new("foo", 0, 0), Item.new("bar", 6, 5)]
        @gilded_rose = GildedRose.new(@items)
        @gilded_rose.update_quality()
      end
      it "does not change the name" do
        expect(@items[0].name).to eq "foo"
      end
      it "reduces the sell_in counter by 1" do
        expect(@items[1].sell_in).to eq 5
      end
      it "reduces the quality counter by 1 for standard items while sell_in is positive" do
        expect(@items[1].quality).to eq 4
      end
      it "cannot make the quality of an item negative" do
        @gilded_rose.update_quality()
        expect(@items[0].quality).to eq 0
      end
      it "cannot make the quality of an item negative" do
        @gilded_rose.update_quality()
        expect(@items[0].quality).to eq 0
      end
      it "quality decreases by 2 when sell_in <= 0" do
        items = [Item.new("foo", 0, 6)]
        gilded_rose = GildedRose.new(items)
        gilded_rose.update_quality()
        expect(items[0].quality).to eq 4
      end
      it "cannot make the quality of an item greater than 50" do
        items = [Item.new("Aged Brie", 20, 49)]
        gilded_rose = GildedRose.new(items)
        2.times { gilded_rose.update_quality() }
        expect(items[0].quality).to eq 50
      end
    end
    context 'for Aged Brie' do
      before(:each) do
        @items = [Item.new("Aged Brie", 6, 5), Item.new("foo", 6, 5)]
        @gilded_rose = GildedRose.new(@items)
        @gilded_rose.update_quality()
      end
      it "does not change the name" do
        expect(@items[0].name).to eq "Aged Brie"
      end
      it "reduces the sell_in counter by 1" do
        expect(@items[0].sell_in).to eq 5
      end
      it "increases the quality counter by 1 while sell_in is positive" do
        expect(@items[0].quality).to eq 6
      end
    end
    context 'for Sulfuras' do
      before(:each) do
        @items = [Item.new("Sulfuras, Hand of Ragnaros", 6, 5), Item.new("foo", 6, 5)]
        @gilded_rose = GildedRose.new(@items)
        @gilded_rose.update_quality()
      end
      it "does not change the name" do
        expect(@items[0].name).to eq "Sulfuras, Hand of Ragnaros"
      end
      it "does not change sell_in counter" do
        expect(@items[0].sell_in).to eq 6
      end
      it "does not change quality counter" do
        expect(@items[0].quality).to eq 5
      end
    end
    context 'for Backstage Pass' do
      before(:each) do
        @items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 12, 5),
                  Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 5),
                  Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 5)]
        @gilded_rose = GildedRose.new(@items)
        @gilded_rose.update_quality()
      end
      it "does not change the name" do
        expect(@items[0].name).to eq "Backstage passes to a TAFKAL80ETC concert"
      end
      it "reduces the sell_in counter by 1" do
        expect(@items[0].sell_in).to eq 11
      end
      it "increases quality counter by 1 when sell_in > 10" do
        expect(@items[0].quality).to eq 6
      end
      it "increases quality counter by 2 when sell_in is between 10 and 6" do
        expect(@items[1].quality).to eq 7
      end
      it "increases quality counter by 3 when sell_in is between 5 and 0" do
        expect(@items[2].quality).to eq 8
      end
      it "quality drops to 0 when sell_in reaches 0" do
        5.times { @gilded_rose.update_quality() }
        expect(@items[2].quality).to eq 0
      end
    end
    context 'for Conjured items' do
    	it 'decreases quality by 2' do
    		items = [Item.new("Conjured Mountain Goat", 6, 6)]
	        gilded_rose = GildedRose.new(items)
	        2.times { gilded_rose.update_quality() }
	        expect(items[0].quality).to eq 2
	    end
	end
  end



end
