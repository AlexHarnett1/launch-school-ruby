def bubble_sort!(arr)
  exchange = true
  while exchange do
    exchange = false
    arr.each_with_index do |value, index|
      break if index == arr.length - 1
      if value > arr[index + 1]
        exchange = true
        arr[index] = arr[index + 1]
        arr[index + 1] = value
      end
    end
  end
end


array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)