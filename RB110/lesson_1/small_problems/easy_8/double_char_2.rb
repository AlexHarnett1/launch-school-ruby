def double_consonants(str)
  double_str = ""
  str.each_char do |char|
    double_str << char
    double_str << char if !char.match?(/[aeiou]/) && char.match?(/[a-zA-Z]/)
  end
  double_str
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""