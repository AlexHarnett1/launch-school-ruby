def zip(arr1, arr2)
  new_arr = []
  arr1.each_with_index {|_,index| new_arr << [arr1[index], arr2[index]] }
  new_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]