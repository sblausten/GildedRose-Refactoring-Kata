require './gilded_rose'

describe GildedRose do

  describe "#update_quality" do
  	before(:each) do
  		@items = [Item.new("foo", 0, 0), Item.new("foo", 6, 5)]
  		GildedRose.new(@items).update_quality()
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
    context 'for Aged Brie' do
    	before(:each) do
	  		@items = [Item.new("Aged Brie", 6, 5), Item.new("foo", 6, 5)]
	  		@gilded_rose = GildedRose.new(@items)
	  	end
    	it "does not change the name" do
	      @gilded_rose.update_quality()
	      expect(@items[0].name).to eq "Aged Brie"
	    end
	    it "reduces the sell_in counter by 1" do
	      @gilded_rose.update_quality()
	      expect(@items[0].sell_in).to eq 5
	    end
	    it "increases the quality counter by 1 while sell_in is positive" do
	      @gilded_rose.update_quality()
	      expect(@items[0].quality).to eq 6
	    end
	end
  end



end
