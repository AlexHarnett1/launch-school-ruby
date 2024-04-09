def each_with_index(arr)
  index = 0
  loop do 
    yield(arr[index], index)
    index += 1
    break if index >= arr.size
  end
  arr
end

=begin
Better

def each_with_index(array)
  index = 0
  array.each do |item|
    yield(item, index)
    index += 1
  end
end

=end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]