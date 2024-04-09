def step(start_value, end_value, step)
  current = start_value
  while current <= end_value do
    yield(current)
    current += step
  end
  current
end

step(1, 10, 3) { |value| puts "value = #{value}" }