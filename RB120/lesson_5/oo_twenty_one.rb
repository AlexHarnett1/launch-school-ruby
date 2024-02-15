require "pry"

class Participant
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def hit(card)
    cards << card
  end

  def busted?
    total > 21
  end

  def total
    tot = 0
    ace = false
    cards.each do |card|
      if card.number.to_i == card.number
        tot += card.number
      elsif card.number == 'A'
        ace = true
        tot += 1
      else
        tot += 10
      end
    end
    tot += 10 if ace && (tot + 10) <= 21
    tot
  end
end

class Deck
  attr_accessor :cards

  SUITS = ["Diamonds", "Hearts", "Clubs", "Spades"]

  def initialize
    @cards = []
    shuffle
  end

  def shuffle
    4.times do |value|
      @cards.push(Card.new(SUITS[value], "A"))
      (2..10).each do |num|
        @cards.push(Card.new(SUITS[value], num))
      end
      @cards.push(Card.new(SUITS[value], "J"))
      @cards.push(Card.new(SUITS[value], "Q"))
      @cards.push(Card.new(SUITS[value], "K"))
    end
    @cards.shuffle!
  end

  def to_s
    arr = []
    @cards.each do |card|
      arr << card.to_s
    end
    arr
  end
end

class Card
  attr_reader :number

  def initialize(suit, number)
    # what are the "states" of a card?
    @suit = suit
    @number = number
  end

  def to_s
    "#{@number} of #{@suit}"
  end
end

class Game
  attr_accessor :player, :dealer, :deck

  def initialize
    @player = Participant.new
    @dealer = Participant.new
    @deck = Deck.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    if player.total <= 21
      dealer_turn
    end
    show_result
  end

  def deal_cards
    player.cards = [deck.cards.pop, deck.cards.pop]
    dealer.cards = [deck.cards.pop, deck.cards.pop]
  end

  def show_initial_cards
    puts "Player has #{player.cards[0]} and #{player.cards[1]}. Your total is #{player.total}"
    puts "Dealer shows #{dealer.cards[0]}"
  end

  def show_player_last_card_dealt
    puts "Player dealt #{player.cards.last}. Your total is #{player.total}"
  end

  def show_dealer_last_card_dealt
    puts "Dealer dealt #{dealer.cards.last}. Their total is #{dealer.total}"
  end

  def player_turn
    loop do
      puts "Would you like to hit or stay?"
      response = gets.chomp
      if response[0].downcase == 'h'
        player.hit(deck.cards.pop)
        show_player_last_card_dealt
      end
      break if player.busted?
      break if response[0].downcase == 's'
    end
  end

  def dealer_turn
    puts "Dealer has #{dealer.cards[0]} and #{dealer.cards[1]}"
    loop do
      break if dealer.total >= 17
      puts "Dealer hits"
      dealer.hit(deck.cards.pop)
      show_dealer_last_card_dealt
    end
  end

  def show_result
    if dealer.busted?
      puts "Dealer busted. Congrats, you won!"
    elsif player.busted?
      puts "You busted, you lose!"
    elsif player.total == dealer.total
      puts "It's a push!"
    else
      puts "#{dealer.total < player.total ? 'Player' : 'Dealer'} won!"
    end
  end
end

Game.new.start
