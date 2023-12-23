def sum(num)
  sum = 0
  num.to_s.chars.map { |char| sum += char.to_i}
  sum
end


puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45