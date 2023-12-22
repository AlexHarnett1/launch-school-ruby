def repeater(str)
  double_str = ""
  str.each_char { |char| double_str << char * 2 }
  double_str
end

p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''