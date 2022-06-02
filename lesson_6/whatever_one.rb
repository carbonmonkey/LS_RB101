GOAL = 31

DEALER_STAND = (GOAL - 4)

SUITS = %w(Hearts Clubs Diamonds Spades)

RANKS_AND_VALUES = {
  'Ace' => 1, '2' => 2, '3' => 3, '4' => 4,
  '5' => 5, '6' => 6, '7' => 7, '8' => 8,
  '9' => 9, '10' => 10, 'Jack' => 10, 'Queen' => 10,
  'King' => 10
}

def prompt(words)
  puts "=> #{words}"
end

def display_greeting
  system('clear')

  prompt "Welcome to #{GOAL}!\n\n"
  prompt "The player closest to #{GOAL} without going over wins\n\n"
  prompt "First to 5 wins is the Grand Winner\n\n"
  prompt 'Press Enter to play'
  gets
end

def initialize_deck!(deck)
  SUITS.each do |suit|
    RANKS_AND_VALUES.each_key do |rank|
      deck << [rank, suit]
    end
  end
  deck.shuffle!
end

def deal_card!(deck, hand, player, hidden_card = false)
  card = deck.pop
  hand << card
  display_card_dealt(card, player, hidden_card)
end

def display_card_dealt(card, player, hidden_card = false)
  card_info = (hidden_card ? 'Face down card' : "#{card[0]} of #{card[1]}")
  prompt "#{card_info} is dealt to #{player}\n\n"
  sleep(0.5)
end

def deal_initial_hands!(deck, dealer_hand, player_hand)
  2.times do |_|
    hidden_card = dealer_hand.empty?
    deal_card!(deck, player_hand, 'player')
    deal_card!(deck, dealer_hand, 'dealer', hidden_card)
  end
end

def display_hand(hand, player, hidden_card = false)
  prompt "The #{player}'s cards are:"
  if hidden_card
    card = hand[1]
    prompt "Face-down card"
    prompt "#{card[0]} of #{card[1]}"
  else
    hand.each { |crd| prompt "#{crd[0]} of #{crd[1]}" }
  end
end

# rubocop:disable Metrics/AbcSize, Metrics/MethodLength
def illustrate_hand(cards, hidden_card = false)
  cards = [[' ', '_'], cards.last] if hidden_card
  num_of_cards = cards.size

  num_of_cards.times { |_| print " ___  " }
  puts

  cards.each do |card|
    rank = card[0][0]
    if rank == '1'
      print "|10 | "
    else
      print "|#{rank}  | "
    end
  end
  puts

  num_of_cards.times { |_| print "|   | " }
  puts ''

  cards.each do |card|
    suite = card[1][0]
    print "|__#{suite}| "
  end
  puts "\n\n"
end
# rubocop:enable Metrics/AbcSize, Metrics/MethodLength

def display_dealer_info(hand, total, hidden_card = false)
  display_hand(hand, 'dealer', hidden_card)
  illustrate_hand(hand, hidden_card)
  display_hand_total(total, 'dealer') unless hidden_card
end

def display_player_info(hand, total)
  display_hand(hand, 'player')
  illustrate_hand(hand)
  display_hand_total(total, 'player')
end

def display_game_info(dealer_hand, player_hand, dealer_total,
                      player_total, hidden_card = false)
  display_dealer_info(dealer_hand, dealer_total, hidden_card)
  display_player_info(player_hand, player_total)
end

def number_of_aces(cards)
  cards.count { |card| card[0] == 'Ace' }
end

def calculate_hand_total(cards)
  total = 0

  # total the value of the hand with aces worth 1
  cards.each { |card| total += RANKS_AND_VALUES[card[0]] }

  # add 10 for each ace if it doesn't cause a bust
  number_of_aces(cards).times do |_|
    break if busted?(total + 10)
    total += 10
  end

  total
end

def busted?(hand_total)
  hand_total > GOAL
end

def push?(hand1, hand2)
  hand1 == hand2
end

def display_hand_total(hand_total, player)
  prompt "The total for the #{player}'s hand is #{hand_total}\n\n"
end

def display_results(result)
  case result
  when :player_bust
    prompt "You bust! Dealer wins!\n\n"
  when :dealer_bust
    prompt "Dealer busts! You win!\n\n"
  when :push
    prompt "It's a push!\n\n"
  when :player_win
    prompt "Player wins!\n\n"
  else
    prompt "Dealer wins!"
  end
end

def player_hit?
  prompt "Would you like to hit or stay? (H or S)"
  response = ''
  loop do
    response = gets.chomp.downcase.strip
    break if %w(h s).include?(response)
    prompt "Sorry, that's not a valid choice. Please enter H or S"
  end
  response == 'h'
end

def play_again?
  prompt 'Would you like to play again?'
  answer = ''
  loop do
    answer = gets.chomp.downcase.strip
    break if %w(y n).include?(answer)
    prompt 'Not a valid input. Please enter y or n'
  end
  answer == 'y'
end

def calculate_match_result(dealer_total, player_total)
  if busted?(player_total)
    :player_bust
  elsif busted?(dealer_total)
    :dealer_bust
  elsif push?(dealer_total, player_total)
    :push
  else
    dealer_total > player_total ? :dealer_win : :player_win
  end
end

def display_scores(scores)
  prompt "The score is player #{scores[:player]}, dealer #{scores[:dealer]}\n\n"
end

def update_score!(scores, result)
  case result
  when :dealer_win then scores[:dealer] += 1
  when :player_bust then scores[:dealer] += 1
  when :player_win then scores[:player] += 1
  when :dealer_bust then scores[:player] += 1
  end
end

def reset_scores!(scores)
  scores[:player] = 0
  scores[:dealer] = 0
end

def grand_winner?(scores)
  scores.values.any? { |score| score >= 5 }
end

def display_grand_winner(scores)
  grand_winner = scores[:dealer] > scores[:player] ? 'Dealer' : 'Player'
  prompt "#{grand_winner} is the Grand Winner!"
end

# start game

display_greeting

scores = { player: 0, dealer: 0 }

loop do # main loop
  system('clear')

  # set up game

  deck = []
  player_hand = []
  dealer_hand = []

  initialize_deck!(deck)

  deal_initial_hands!(deck, dealer_hand, player_hand)

  dealer_total = calculate_hand_total(dealer_hand)
  player_total = calculate_hand_total(player_hand)

  sleep(0.5)
  system('clear')

  # player turn

  until busted?(player_total)
    display_game_info(dealer_hand, player_hand, dealer_total,
                      player_total, :hidden_card)

    break unless player_hit?

    deal_card!(deck, player_hand, 'player')
    player_total = calculate_hand_total(player_hand)

    sleep(0.5)
    system('clear')
  end

  if busted?(player_total)
    system('clear')

    display_game_info(dealer_hand, player_hand, dealer_total, player_total)

    display_results(:player_bust)

    update_score!(scores, :player_bust)
    display_scores(scores)

    if grand_winner?(scores)
      display_grand_winner(scores)
      reset_scores!(scores)
    end

    next if play_again?
    break
  else
    prompt "You chose to stay\n\n"
    sleep(0.5)
  end

  # dealer turn

  hidden_crd = dealer_hand.first
  prompt "Dealer reveals hidden card #{hidden_crd[0]} of #{hidden_crd[1]}\n\n"
  sleep(1)

  until dealer_total >= DEALER_STAND
    deal_card!(deck, dealer_hand, 'dealer')
    dealer_total = calculate_hand_total(dealer_hand)
  end

  sleep(1)
  system('clear')

  display_game_info(dealer_hand, player_hand, dealer_total, player_total)

  result = calculate_match_result(dealer_total, player_total)
  display_results(result)

  update_score!(scores, result)
  display_scores(scores)

  if grand_winner?(scores)
    display_grand_winner(scores)
    reset_scores!(scores)
  end

  break unless play_again?
end

prompt "Thank you for playing #{GOAL}!"
