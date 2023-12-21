def find_dup(arr)
  num = arr.select do |value|
    !arr.one?(value)
  end

  return num[0]
end


# def find_dup(array)
#   array.find { |element| array.count(element) == 2 }
# end
