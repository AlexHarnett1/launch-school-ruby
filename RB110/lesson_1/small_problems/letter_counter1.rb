def word_sizes(sentence)
  words = sentence.split
  hash = {}
  words.each do |word|
    hash[word.length] = (hash.has_key?(word.length) ? (hash[word.length] + 1): 1)
  end
  hash
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

=begin
A better way to do it...
Defining the hash with Hash.new(0) will force any non existing keys to initialize to 0 instead of nil.

def word_sizes(words_string)
  counts = Hash.new(0)
  words_string.split.each do |word|
    counts[word.size] += 1
  end
  counts
end

=end
