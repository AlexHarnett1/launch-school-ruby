def leading_substrings(str)
  temp_str = ""
  arr = []
  str.each_char do |char|
    temp_str += char
    arr << temp_str
  end
  arr
end

def substrings(str)
  arr = []
  str.length.times do 
    arr << leading_substrings(str)
    str = str[1, str.length - 1]
  end
  arr.flatten
end

p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]