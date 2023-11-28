def swap(sentence)
  words = sentence.split(" ")
  words.map! do |word|
    char = word[0]
    word[0] = word[-1]
    word[-1] = char
    word
  end

  words.join(" ")
end



p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'