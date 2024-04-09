=begin
solution 1
def divisors(num)
  (1..num).select do |divisor|
    num % divisor == 0
  end
end
=end

=begin
#Takes half the time of the above solution
def divisors(num)
  top_num = num/2 + 1
  arr = []
  (1..top_num).each do |divisor|
    if num % divisor == 0
      arr << divisor
      arr << num/divisor
    end
  end
  arr.sort.uniq
end
=end

#Takes no time
def divisors(num)
  result = []
  (1..Math.sqrt(num)).each do |x|
    result << x << num / x if num % x == 0
  end
  result.uniq.sort
end


p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute