def reverse_words(str)
  words = str.split
  words.map! do |word|
    if word.length >= 5 then word.reverse
    else word
    end
  end
  words.join(" ")
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS