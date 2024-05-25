class Scrabble
  attr_accessor :word

    POINTS = {
    'AEIOULNRST'=> 1,
    'DG' => 2,
    'BCMP' => 3,
    'FHVWY' => 4,
    'K' => 5,
    'JX' => 8,
    'QZ' => 10
}

  def initialize(word)
    @word = word
  end

  def self.score(word)
    Scrabble.new(word).score
  end


  def score
    return 0 if word == nil || word.delete(' ') == ''
    letters = word.split('')
    sum = 0
    letters.each do |letter|
      sum += POINTS[get_key(letter)]
    end
    sum
  end

  private

  def get_key(letter)
    POINTS.keys.each do |key|
      return key if key.include?(letter.upcase)
    end
  end

end


p "\t\n"