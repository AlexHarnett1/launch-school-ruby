def multiply_all_pairs(arr1, arr2)
  products = []
  arr1.each do |v1|
    arr2.each { |v2| products << v1 * v2}
  end
  products.sort
end

p multiply_all_pairs([2, 4], [4, 3, 1, 2]) == [2, 4, 4, 6, 8, 8, 12, 16]