def swapcase(str)
  chars = str.chars
  chars.map! do |char|
    if char.match?(/[A-Z]/) then char.downcase!
    elsif char.match?(/[a-z]/) then char.upcase!
    else char
    end
  end
  chars.join
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'