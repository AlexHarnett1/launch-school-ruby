class GuessingGame
  def initialize
    @number = 0
    @won = false
  end

  def play
    @number = rand(101)
    @guesses_remaining = 7
    while @guesses_remaining > 0
      puts "You have #{@guesses_remaining} guesses remaining."
      print "Enter a number between 1 and 100: "
      guess = gets.chomp.to_i
      while guess_invalid?(guess)
        puts "Invalid guess. Enter a number between 1 and 100: "
        guess = gets.chomp.to_i
      end
      if user_win?(guess)
        puts "That's the number!"
        @won = true
        break
      else
        check_guess(guess)
        @guesses_remaining -= 1
      end
    end
    if @won
      puts "You won!"
    else
      puts "You lost!"
    end
  end
  
  private

  def guess_invalid?(guess)
    guess > 100 || guess < 0
  end

  def user_win?(guess)
    @number == guess
  end

  def check_guess(guess)
    if guess > @number
      puts "Your guess is too high."
    elsif guess < @number
      puts "Your guess is too low."
    else
      puts "That's the number!"
    end
    puts ""
  end

end

game = GuessingGame.new
game.play

=begin
You have 7 guesses remaining.
Enter a number between 1 and 100: 104
Invalid guess. Enter a number between 1 and 100: 50
Your guess is too low.

You have 6 guesses remaining.
Enter a number between 1 and 100: 75
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 85
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 0
Invalid guess. Enter a number between 1 and 100: 80

You have 3 guesses remaining.
Enter a number between 1 and 100: 81
That's the number!

You won!

game.play

You have 7 guesses remaining.
Enter a number between 1 and 100: 50
Your guess is too high.

You have 6 guesses remaining.
Enter a number between 1 and 100: 25
Your guess is too low.

You have 5 guesses remaining.
Enter a number between 1 and 100: 37
Your guess is too high.

You have 4 guesses remaining.
Enter a number between 1 and 100: 31
Your guess is too low.

You have 3 guesses remaining.
Enter a number between 1 and 100: 34
Your guess is too high.

You have 2 guesses remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have 1 guess remaining.
Enter a number between 1 and 100: 32
Your guess is too low.

You have no more guesses. You lost!
=end