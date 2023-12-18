GAMES_TO_WIN = 3
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts msg
end

def joinor(arr, punct = ', ', joing_word = 'or')
  if(arr.length == 1)
    return arr[0].to_s
  elsif
    (arr.length ==2)
    return arr[0].to_s + joing_word + arr[1].to_s
  end

  str = ''
  arr.each_with_index do |value, index|
    if (index != arr.length - 1)
      str << (value.to_s + punct)
    else
      str << (joing_word + " " + value.to_s)
    end
  end
  str
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

# rubocop:enable Metrics/MethodLength, Metrics/AbcSize
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_places_piece!(brd)
  square = ''
  loop do
    # prompt "Choose a square (#{empty_squares(brd).join(', ')}):"
    prompt "Choose a square #{joinor(empty_squares(brd))}:"
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)

    prompt "Try again, that choice is invalid."
  end
  brd[square] = PLAYER_MARKER
end

def find_place_for_piece(brd, marker)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      line.each do |value|
        if brd[value] == INITIAL_MARKER
          return value
        end
      end
    end
  end
  return 0
end


def computer_places_piece!(brd)
  square = find_place_for_piece(brd, COMPUTER_MARKER)
  if (square != 0)
    brd[square] = COMPUTER_MARKER
    return
  end
  square = find_place_for_piece(brd, PLAYER_MARKER)
  if(square !=0)
    brd[square] = COMPUTER_MARKER
    return
  end
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def main()
  player_wins = 0
  computer_wins = 0
  loop do
    board = initialize_board
    loop do
      display_board(board)
      puts "The score is - You: #{player_wins}  Computer: #{computer_wins}"
      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    # if someone_won?(board)
    #   prompt "#{detect_winner(board)} won!"
    # else
    #   prompt "It's a tie!"
    # end

    if (detect_winner(board) == 'Player')
      player_wins += 1 
    elsif (detect_winner(board) == 'Computer')
      computer_wins += 1
    end

    break if (player_wins == GAMES_TO_WIN || computer_wins == GAMES_TO_WIN)

    #prompt "Play again? (y or n)"
    #answer = gets.chomp
    #break unless answer.downcase.start_with?('y')
  end
  winner = (player_wins > computer_wins ? "Player" : "Computer")
  prompt "#{winner} wins #{GAMES_TO_WIN}! Thanks for playing Tic Tac Toe. Bye!"
end

main()