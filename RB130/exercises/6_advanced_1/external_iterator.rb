enum = Enumerator.new do |y|
  count = 0
  a = 1
  loop do
    y << a
    count += 1
    a *= count
  end

end

7.times do |num|
  p enum.next
end

3.times do |num|
  p enum.next
end

enum.rewind

7.times do |num|
  p enum.next
end