VALID_CHOICES = %w(rock paper scissors spock lizard)
WINNERS = { "rock" => ['scissors', 'lizard'],
            "paper" => ['rock', 'spock'],
            "scissors" => ['lizard', 'paper'],
            "lizard" => ['spock', 'paper'],
            "spock" => ['scissors', 'rock'] }

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  WINNERS[first].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won!")
  elsif win?(computer, player)
    prompt("You lost!")
  else
    prompt("Tie!")
  end
end

choice = ''
player_points = 0
computer_points = 0
loop do
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    if VALID_CHOICES.include?(choice)
      break
    else
      prompt("That's not a valid choice. Try again")
    end
  end

  computer_choice = VALID_CHOICES.sample
  prompt("You chose #{choice}. Computer chose #{computer_choice}.")

  display_results(choice, computer_choice)
  player_points += 1 if win?(choice, computer_choice)
  computer_points += 1 if win?(computer_choice, choice)

  if player_points >= 3
    prompt("You are the grand winner!")
    break
  elsif computer_points >= 3
    prompt("The computer is the grand winner!")
    break
  end
  # prompt("Would you like to play again?(y/n)")
  # answer = gets.chomp
  # break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing! Goodbye.")
