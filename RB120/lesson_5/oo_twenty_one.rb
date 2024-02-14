class Participant
  attr_accessor :cards
  def initialize
    @cards = []
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
  end
end

class Player < Participant

  def initialize
    # what would the "data" or "states" of a Player object entail?
    # maybe cards? a name?
  end

  def hit
  end

  def stay
  end

  def busted?
  end

  def total
    # definitely looks like we need to know about "cards" to produce some total
  end
end

class Dealer < Participant
  def initialize
    # seems like very similar to Player... do we even need this?
  end

end

class Deck
  attr_accessor :cards
  def initialize
    @cards = []
    shuffle
  end

  def deal
    # does the dealer or the deck deal?
  end

  def shuffle
    suits = ["Diamonds", "Hearts", "Clubs", "Spades"]
    4.times do |value|
      @cards.push(Card.new(suits[value], "A"))
      (2..10).each do |num|
        @cards.push(Card.new(suits[value], num))
      end
      @cards.push(Card.new(suits[value], "J"))
      @cards.push(Card.new(suits[value], "Q"))
      @cards.push(Card.new(suits[value], "K"))
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
    @player = Player.new
    @dealer = Dealer.new
    @deck = Deck.new
  end

  def start
    deal_cards
    show_initial_cards
    player_turn
    # dealer_turn
    # show_result
    
  end

  def deal_cards
    player.cards = [deck.cards.pop, deck.cards.pop]
    dealer.cards = [deck.cards.pop, deck.cards.pop]
  end

  def show_initial_cards
    puts "Player has #{player.cards[0]} and #{player.cards[1]}"
    puts "Dealer shows #{dealer.cards[0]}"
  end

  def player_turn
    loop do
      puts "Would you like to hit or stay?"
      response = gets.chomp
      

      break if response[0].downcase == 's'
      
    end
  end
end

Game.new.start