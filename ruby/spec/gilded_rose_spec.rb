require './gilded_rose'

describe GildedRose do

  describe "#update_quality" do
  	before(:each) do
  		@items = [Item.new("foo", 0, 0), Item.new("foo", 6, 5)]
  	end
    it "does not change the name" do
      GildedRose.new(@items).update_quality()
      expect(@items[0].name).to eq "foo"
    end
    it "reduces the sell_in counter by 1" do
      GildedRose.new(@items).update_quality()
      expect(@items[1].sell_in).to eq 5
    end
  end



end
