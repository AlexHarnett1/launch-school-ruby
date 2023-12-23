def get_grade(g1, g2, g3)
  avg = (g1 + g2 + g3) / 3

case (avg)
when 90..100
  "A"
when 80..89
  "B"
when 70..79
  "C"
when 60..69
  "D"
else
  "F"
end

end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"