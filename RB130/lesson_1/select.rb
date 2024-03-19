def select(arr)
  count = 0
  arr2 = []

  while count < arr.length
    if yield(arr[count])
      arr2 << arr[count]
    end
    count += 1
  end

  arr2
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true