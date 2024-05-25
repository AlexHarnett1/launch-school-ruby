class BeerSong

  NORMAL1 = "99 bottles of beer on the wall, 99 bottles of beer.\n"
  NORMAL2 = "Take one down and pass it around, 98 bottles of beer on the wall.\n"
  ZERO2 = "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def self.verse(verse_num)
    line1,line2 = ''
    line1 = NORMAL1.gsub(/\d+/, verse_num.to_s)
    line2 = NORMAL2.gsub(/\d+/, (verse_num - 1).to_s)
    if verse_num == 1
      line1.gsub!(/bottles/, 'bottle')
      line2.gsub!(/0/, 'no more')
      line2.gsub!(/one/, 'it')
    elsif verse_num == 2
      line2.gsub!(/bottles/, 'bottle')
    elsif verse_num == 0
      line1.gsub!(/0/, 'No more').downcase!.capitalize!
      line2 = ZERO2
    end
    line1 + line2
  end

  def self.verses(*verses)
    lyrics = ''
    (verses.first).downto(verses.last) do |verse_num|
      lyrics += verse(verse_num)
      lyrics += "\n"
    end
    lyrics.chomp
  end


  def self.lyrics
    verses(99,0)
  end

end