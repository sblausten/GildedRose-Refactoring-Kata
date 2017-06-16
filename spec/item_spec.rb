require './item'

describe Item do
  describe '#new' do
  	before(:each) do
  		@item = Item.new("name", 5, 7)
  	end
  	it 'saves name as instance variable on initialization' do
  		expect(@item.name).to eq "name"
  	end
  	it 'saves sell_in as instance variable on initialization' do
  		expect(@item.sell_in).to eq 5
  	end
  	it 'saves quality as instance variable on initialization' do
  		expect(@item.quality).to eq 7
  	end
  end
end