def next_odd_divisible_by_7(num)
  num += (7 - (num % 7))
  num += 7 if num % 2 == 0
  num
end

def uniq_nums?(num)
  nums = num.to_s.chars
  nums == nums.uniq
end

def featured(num)
  num = next_odd_divisible_by_7(num)
  while(!uniq_nums?(num))
    num = next_odd_divisible_by_7(num)
  end
  num
end

p featured(12) == 21
p featured(20) == 21
p featured(21) == 35
p featured(997) == 1029
p featured(1029) == 1043
p featured(999_999) == 1_023_547
p featured(999_999_987) == 1_023_456_987

#featured(9_999_999_999) # -> There is no possible number that fulfills those requirements