def include?(arr, num)
  arr.each do |value|
    return true if value == num
  end
  false
end

# def include?(array, value)
#   !!array.find_index(value)
# end
