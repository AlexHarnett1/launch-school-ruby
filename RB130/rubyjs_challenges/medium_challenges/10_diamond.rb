class Diamond
  A_ORD = 65

  def self.make_diamond(letter)
    if letter == 'A'
      return "A\n"
    end

    str = ''
    current_letter_ord = A_ORD + 1
    lines = ((letter.ord - A_ORD) * 2) - 1

    add_A_line((letter.ord - A_ORD), str)

    reached_middle = false

    while lines > 0 do 
      middle_spaces = ((current_letter_ord - A_ORD) * 2) - 1

      add_spaces((letter.ord - current_letter_ord), str)

      str << current_letter_ord.chr

      add_spaces(middle_spaces, str)

      str << current_letter_ord.chr

      add_spaces((letter.ord - current_letter_ord), str)
      
      str << "\n"
      
      reached_middle = (letter.ord == current_letter_ord) if (!reached_middle)

      if reached_middle
        current_letter_ord -= 1
      else
        current_letter_ord += 1
      end
      lines -= 1
    end

    add_A_line((letter.ord - A_ORD), str)
    str

  end


  private 

  def self.add_spaces(num_spaces, str)
    num_spaces.times do |x|
        str << ' '
    end
  end

  def self.add_A_line(num_spaces, str)
    add_spaces(num_spaces, str)
    str << 'A'
    add_spaces(num_spaces, str)
    str << "\n"
  end

end

Diamond.make_diamond('A')

=begin
Edge case where letter is A just return 'A'

Start the diamond with a single A
Each other line has two of the letter
End the diamond with a single A

Example

 A 
B B
 A

  A  
 B B 
C   C
 B B 
  A


Treat the other letters different from the A lines.

Lines = (letter.ord - A.ord) * 2 + 1
Spaces = Lines - 2
Number of spaces before given letter = letter.ord - current_letter.ord
Number of spaces between letters = current_letter.ord - A.ord

spaces.times do



=end
