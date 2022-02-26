require 'yaml'
COLLECTIONS = YAML.load_file('rock_paper_scissors_collections.yml')

def prompt(message)
  puts "=> #{message}"
end

def grab(key, subkey = '')
  subkey.empty? ? COLLECTIONS[key] : COLLECTIONS[key][subkey]
end

def display_choices
  prompt("Choose one:")

  grab('valid_choices').each do |key, value|
    until value.length >= 8
      value += ' '
    end

    prompt("#{value} (or #{key})")
  end
end

def get_choice
  loop do
    choice = gets.chomp.downcase.strip

    if grab('valid_choices').include?(choice)
      return grab('valid_choices', choice)

    elsif grab('valid_choices').values.include?(choice)
      return choice

    else
      prompt("That's not a valid choice.")
      prompt("Please try again. You can optionally enter the first letter "\
            "of your choice (or v for spock)")

    end
  end
end

def player_win?(player, computer)
  grab('winning_conditions', player).include?(computer)
end

def computer_win?(player, computer)
  (player != computer) && !player_win?(player, computer)
end

def display_match_results(winner, loser)
  prompt("#{winner} #{grab('verbs', [winner, loser])} #{loser}!")
end

def display_results(player, computer)
  if player == computer
    prompt("It's a tie!")

  elsif player_win?(player, computer)
    display_match_results(player, computer)
    prompt("You won!")

  else
    display_match_results(computer, player)
    prompt('Computer won!')

  end
end

def display_score(score)
  prompt("The score is: you -> #{score[:player]},"\
    " computer -> #{score[:computer]}")
end

def display_winner(score)
  if score[:player] > score[:computer]
    prompt("You are the grand winner!")

  else
    prompt("Sorry, computer is the grand winner. Better luck next time.")

  end
end

def display_title
  puts "#{grab('valid_choices').values.map(&:capitalize).join(', ')} v1.0"
end

system('clear')

display_title
puts ''

prompt "Press 'ENTER' to play..."
gets

system('clear')

loop do # main loop
  score = {
    player: 0,
    computer: 0
  }

  round = 1

  prompt("First to three wins is the grand winner")
  puts ''

  loop do # round loop
    prompt("Round #{round}")

    puts ''
    display_score(score)

    puts ''
    display_choices
    choice = get_choice

    computer_choice = grab('valid_choices').values.sample

    puts ''
    prompt("You chose: #{choice}; Computer chose: #{computer_choice}")
    display_results(choice, computer_choice)

    score[:player] += 1 if player_win?(choice, computer_choice)
    score[:computer] += 1 if computer_win?(choice, computer_choice)

    break if score[:player] == 3 || score[:computer] == 3

    round += 1

    puts ''
    prompt("Press 'ENTER' to begin round #{round}")
    gets

    system('clear')
  end

  puts ''
  display_winner(score)

  puts ''
  prompt("Do you want to play again?")
  answer = gets.chomp

  break unless answer.downcase.start_with?('y')
  system('clear')
end

prompt("Thank you for playing. Good bye!")
puts ''
