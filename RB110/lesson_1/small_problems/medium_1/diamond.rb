def get_line(original_n, n)
  line = ""
  if (original_n == n)
    line << ("*" * n)
  else
    num_spaces = (original_n - n) / 2
    line << ' ' * num_spaces
    line << "*" * n
    line << ' ' * num_spaces
  end
  line
end

def diamond(n)
  (1..n).each do |iteration|
    p get_line(n, iteration) if iteration.odd? 
  end
  (2..n).each do |iteration|
    p get_line(n, (n + 1) - iteration) if iteration.odd? 
  end
end

diamond(9)

# def print_row(grid_size, distance_from_center)
#   number_of_stars = grid_size - 2 * distance_from_center
#   stars = '*' * number_of_stars
#   puts stars.center(grid_size)
# end

# def diamond(grid_size)
#   max_distance = (grid_size - 1) / 2
#   max_distance.downto(0) { |distance| print_row(grid_size, distance) }
#   1.upto(max_distance)   { |distance| print_row(grid_size, distance) }
# end