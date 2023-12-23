def buy_fruit(list)
  arr = []
  list.each do |item|
    item[1].times {arr << item[0]}
  end
  arr
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]