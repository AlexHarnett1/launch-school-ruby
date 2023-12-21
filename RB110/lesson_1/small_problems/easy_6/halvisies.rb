def halvsies(arr)
  arr1 = []
  arr2 = []
  split_point = ((arr.length + 1) / 2) - 1
  arr.each_with_index do |value, index|
    if index <= split_point then arr1 << value
    else arr2 << value
    end
  end

  [arr1, arr2]
end
