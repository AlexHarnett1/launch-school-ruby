def to_weird_case(str)
  words = str.split
  new_words = []
  word_count = 0
  words.each do |word|
    word_count += 1
    if (word.length == 1 || word_count % 3 != 0)
      new_words << word 
    else
      char_count = 0
      new_word = word.chars.map do |char|
        char_count += 1
        if char_count % 2 == 0 then char.upcase
        else char
        end
      end
      new_words << new_word.join('')
    end
  end
  new_words.join(' ')
end

# Write a method named to_weird_case that accepts a string, and
# returns the same sequence of characters with every 2nd character
# in every third word converted to uppercase. Other characters
# should remain the same.

# Examples:

p to_weird_case('Lorem Ipsum is simply dummy text of the printing') ==
                'Lorem Ipsum iS simply dummy tExT of the pRiNtInG'
p to_weird_case(
  'It is a long established fact that a reader will be distracted') ==
  'It is a long established fAcT that a rEaDeR will be dIsTrAcTeD'
p to_weird_case('aaA bB c') == 'aaA bB c'
p to_weird_case(
  'Miss Mary Poppins word is supercalifragilisticexpialidocious') ==
  'Miss Mary POpPiNs word is sUpErCaLiFrAgIlIsTiCeXpIaLiDoCiOuS'

# The tests above should print "true".