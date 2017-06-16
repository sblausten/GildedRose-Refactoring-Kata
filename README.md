## Guilded Rose Kata

Designed to practice refactoring legacy code and writing tests.

Originally created by [Terry Hughes](https://github.com/NotMyself/GildedRose)
Translated to Ruby by [Emily Bache](https://github.com/emilybache/GildedRose-Refactoring-Kata)

View original code base [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/ruby).

View full requirements [here](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt).

## To run tests:

```bash
bundle install
rspec
```
## Summary of [requirements](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/master/GildedRoseRequirements.txt)

### Task:
Add new feature to system for new category of item. 

### Basic system:
	- All items have a SellIn value which denotes the number of days we have to sell the item
	- All items have a Quality value which denotes how valuable the item is
	- At the end of each day our system lowers both values for every item

### Additional features:
	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	- Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	- Quality drops to 0 after the concert

### New requirement:
	- "Conjured" items degrade in Quality twice as fast as normal items

### Kata restrictions:
Only allowed to edit the UpdateQuality method, not the Item class or Items property.

