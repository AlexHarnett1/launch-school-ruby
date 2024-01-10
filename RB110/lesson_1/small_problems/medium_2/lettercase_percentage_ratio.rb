LOWER_ALPHABET = ('a'..'z').to_a
UPPER_ALPHABET = ('A'..'Z').to_a

def letter_percentages(str)
  lower_count = 0
  upper_count = 0
  neither_count = 0
  str.split('').each do |char|
    if LOWER_ALPHABET.include?(char) then lower_count += 1
    elsif UPPER_ALPHABET.include?(char) then upper_count += 1
    else neither_count += 1
    end
  end

  hsh = {lowercase: (lower_count.to_f/str.length*100),
         uppercase: (upper_count.to_f/str.length*100),
         neither: (neither_count.to_f/str.length*100)}
end

p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }