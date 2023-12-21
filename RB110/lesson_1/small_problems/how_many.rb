def count_occurrences(arr)
  hsh = {}
  arr.each do |value|
    if hsh.has_key?(value) then hsh[value] += 1
    else hsh[value] = 1
    end
  end 
  p hsh
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

# Expected Output:
#
# car => 4
# truck => 3
# SUV => 1
# motorcycle => 2