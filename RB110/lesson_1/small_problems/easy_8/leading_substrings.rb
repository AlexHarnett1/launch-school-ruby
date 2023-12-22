def leading_substrings(str)
  temp_str = ""
  arr = []
  str.each_char do |char|
    temp_str += char
    arr << temp_str
  end
  arr
end


p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']