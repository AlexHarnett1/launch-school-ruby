def convert_char(char)
  if ('a'..'m').include?(char) || ('A'..'M').include?(char)
    (char.ord + 13).chr
  elsif ('n'..'z').include?(char) || ('N'..'Z').include?(char)
    (char.ord - 13).chr
  else
    char
  end
end

def unencrypt(str)
  u_string = ''
  str.chars.each do |char|
    u_string << convert_char(char)
  end
  u_string
end

p unencrypt('Nqn Ybirynpr')
p unencrypt('Tenpr Ubccre')