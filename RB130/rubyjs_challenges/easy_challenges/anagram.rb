class Anagram
  attr_accessor :anagram
  def initialize(anagram)
    @anagram = anagram

  end

  def match(words)
    words_passed = []

    anagram_letters = anagram.downcase.split('')

    words.each do |word|
      letters = word.downcase.split('')
      next if word.length != anagram.length || letters == anagram_letters
      passed = true
      letters.each do |letter|
        passed = false if letters.count(letter) != anagram_letters.count(letter)
      end
      words_passed << word if passed
    end
    words_passed
  end
end
