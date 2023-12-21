def digit_list(num)
  array = []
  while num > 0
    array << num % 10
    num /= 10
  end
  array.reverse
end


puts digit_list(12345) == [1, 2, 3, 4, 5]     # => true
puts digit_list(7) == [7]                     # => true
puts digit_list(375290) == [3, 7, 5, 2, 9, 0] # => true
puts digit_list(444) == [4, 4, 4]             # => true


=begin
  A better solution:


def digit_list(number)
  number.to_s.chars.map(&:to_i)
end


=end
