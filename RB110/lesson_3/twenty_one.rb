def initialize_deck()
  cards = []
  9.times do |i|
    4.times { cards << (i + 2).to_s }
  end
  4.times { cards << 'Jack' }
  4.times { cards << 'Queen' }
  4.times { cards << 'King' }
  4.times { cards << 'Ace' }
  cards.shuffle
end

def display_hand(hand, is_player, game_over = false)
  text = is_player ? "Your cards are: " : "Dealer's cards are: "
  if (is_player || game_over)
    if (hand.size == 2)
       text << hand.join(" and ")
    else
      hand.each_with_index do |value, index|
        if (index == hand.size - 1)
          text << "and #{value}"
        else
          text << "#{value}, "
        end
      end
    end
  else
    if (hand.size == 2)
      text << hand[1] + " and an unknown card"
    else
      hand.reverse.each_with_index do |value, index|
        if (index == hand.size - 1)
          text << "and an unknown card"
        else
          text << "#{value}, "
        end
      end
    end
  end
  text
end

def calculate_hand(hand)
  sum = 0
  hand.each do |elem|
    if (elem.to_i != 0)
      sum += elem.to_i
    elsif (elem != "Ace")
      sum += 10
    else
      if sum + 11 < 21 then sum += 11
      else sum += 1
      end
    end
  end
  sum
end

def display_results(p_sum, d_sum)
  puts "You have #{p_sum} and dealer has #{d_sum}"
  if ((p_sum > 21 && d_sum > 21) || (p_sum == d_sum))
    puts "It's a push!"
  elsif ((p_sum > 21 && d_sum <= 21) || (p_sum < d_sum && d_sum <= 21))
    puts "You lose!"
  else
    puts "You win!"
  end
end


def main()
  deck = initialize_deck
  player_hand = [deck.pop, deck.pop]
  dealer_hand = [deck.pop, deck.pop]
  puts display_hand(dealer_hand, false)
  puts display_hand(player_hand, true)
  loop do
    puts ""
    puts "You have #{calculate_hand(player_hand)}. Would you like to hit or stay? (h/s)"
    action = gets.chomp
    break if action.downcase.start_with?('s')

    player_hand << deck.pop
    puts display_hand(player_hand, true)
    break if calculate_hand(player_hand) >= 21
  end

  while (calculate_hand(dealer_hand) < 17)
    dealer_hand << deck.pop
  end

  puts display_hand(player_hand, true)
  puts display_hand(dealer_hand, false, true)
  display_results(calculate_hand(player_hand), calculate_hand(dealer_hand))
end

main()
