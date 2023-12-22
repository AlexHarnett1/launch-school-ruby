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

def palindromes(str)
  subs = substrings(str)
  subs.select! do |value|
    (value == value.reverse && value.length > 1)
  end
  subs
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]