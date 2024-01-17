class Player
  attr_accessor :move
  
  def initialize(player_type = :human)
    @player_type = player_type
    @move = nil
  end

  def choose
    if human?
      choice = nil
      loop do 
        puts "Choose an option: Rock, Paper, or Scissors"
        choice = gets.chomp
        break if ['rock', 'paper', 'scissors'].include?(choice)
        puts "Sorry, invalid choice."
      end
      self.move = choice
    else
      self.move = ['rock', 'paper', 'scissors'].sample
    end
  end

  def human?
    @player_type == :human
  end
end

class RPSGame
  attr_accessor :human, :computer

  def initialize
    @human = Player.new
    @computer = Player.new(:computer)
  end

  def display_welcome_message
    puts "Welcome to RPS!"
  end

  def display_goodbye_message
    puts "Thanks for playing RPS. Goodbye!"
  end

  def display_winner
    puts "You chose #{human.move}"
    puts "The computer chose #{computer.move}"
    case human.move
    when 'rock'
      puts "It's a tie!" if computer.move == 'rock'
      puts "Computer wins!" if computer.move == 'paper'
      puts "You win!" if computer.move == 'scissors'
    when 'paper'
      puts "It's a tie!" if computer.move == 'paper'
      puts "Computer wins!" if computer.move == 'scissors'
      puts "You win!" if computer.move == 'rock'
    when 'scissors'
      puts "It's a tie!" if computer.move == 'scissors'
      puts "Computer wins!" if computer.move == 'rock'
      puts "You win!" if computer.move == 'paper'
    end
  end

  def play_again?
    answer = nil
    loop do 
      puts "Would you like to play again (y/n)?"
      answer= gets.chomp
      break if ['y', 'n'].include?(answer.downcase)
      puts "Sorry, must be y or n"
    end
    answer == 'y'
  end

  def play
    display_welcome_message

    loop do
      human.choose
      computer.choose
      display_winner
      break unless play_again?
    end
    display_goodbye_message
  end
end

RPSGame.new.play